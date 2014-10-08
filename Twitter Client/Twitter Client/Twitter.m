//
//  Twitter.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "Twitter.h"
#import "Twit.h"
#import "User.h"
//------------------------------------------------------------------------------
NSString* API_KEY = @"7RmP45H9CIzTBFAzNywETt1dw";
NSString* API_SECRET = @"ULTxpra7YVpsSzEd3iZrKhSxmE2tKwXOEITwAiQZiuznaLq6u2";
NSString* BASE_URL = @"https://api.twitter.com";
//------------------------------------------------------------------------------
static Twitter* _twitterClient;
//------------------------------------------------------------------------------
@implementation Twitter
{
    NSMutableArray*    _twits;
    User*              _user;
}
//------------------------------------------------------------------------------
+(Twitter *)instance
{
    if (!_twitterClient) {
        _twitterClient = [[Twitter alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]
                                                    consumerKey:API_KEY
                                                 consumerSecret:API_SECRET];
    }
    return _twitterClient;
}
//------------------------------------------------------------------------------
-(void)login
{
    [self.requestSerializer removeAccessToken];
    
    [self fetchRequestTokenWithPath:@"oauth/request_token"
                               method:@"GET"
                          callbackURL:[NSURL URLWithString:@"comalexkalinintwitter://oauth"]
                                scope:nil
                              success:^(BDBOAuthToken *requestToken)
     {
         NSString* url_str = [NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token];
         NSURL* auth_url = [NSURL URLWithString:url_str];
         [[UIApplication sharedApplication]openURL:auth_url];
     }
                              failure:^(NSError *error)
     {
         NSLog(@"Error getting the request token");
     }];
}
//------------------------------------------------------------------------------
-(void)twit_with_text:(NSString*)text success:(void(^)(Twit*))on_success
{
    NSDictionary *parameters = @{@"status": text};
    [self POST:@"1.1/statuses/update.json"
    parameters:parameters
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
           Twit* result = [[Twit alloc]initWithDict:responseObject withTwitter:self];
           [_twits insertObject:result atIndex:0];
           on_success(result);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [[[UIAlertView alloc]initWithTitle:@"Send error"
                                  message:[NSString stringWithFormat:@"%@", error]
                                 delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}
//------------------------------------------------------------------------------
-(void)open_url:(NSURL *)url withSuccess:(void(^)())on_done
{
    [self fetchAccessTokenWithPath:@"oauth/access_token"
                              method:@"POST"
                        requestToken:[BDBOAuthToken tokenWithQueryString:url.query]
                             success:^(BDBOAuthToken *accessToken) {
                                 
                                 NSLog(@"Got access token");
                                 [self.requestSerializer saveAccessToken:accessToken];
                                 
                                 [self GET:@"1.1/account/verify_credentials.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                     User* user = [[User alloc]initWithDict:responseObject];
                                     User.currentUser = user;
                                     on_done();
                                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     NSLog(@"failed to verify user credentials");
                                 }];
                             } failure:^(NSError *error) {
                                 NSLog(@"Fail to get access token");
                             }];

}
//------------------------------------------------------------------------------
-(NSMutableArray*) load_twits_from_json:(NSArray*) json
{
    NSMutableArray* result = [NSMutableArray new];
    
    for (NSDictionary* twit_dict in json) {
        Twit* twit = [[Twit alloc]initWithDict:twit_dict withTwitter:self];
        [result addObject:twit];
    }
    return result;
}
//------------------------------------------------------------------------------
-(unsigned long)get_twit_count
{
    return _twits.count;
}
//------------------------------------------------------------------------------
-(Twit *)twit_at_index:(unsigned long)index
{
    return _twits[index];
}
//------------------------------------------------------------------------------
-(BOOL)is_logged_in
{
    return self.requestSerializer.accessToken;
}
//------------------------------------------------------------------------------
-(void) reload:(void (^)())on_done
{
    [self GET:@"1.1/statuses/home_timeline.json"
   parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
       _twits = [self load_twits_from_json:responseObject];
       on_done();
       
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       NSLog(@"Error: %@", error);
   }];
    
}
//------------------------------------------------------------------------------
-(AFHTTPRequestOperation *) favorite_twit_with_id:(NSString*)tweet_id
                                            success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
                                            failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSDictionary *parameters = @{@"id": tweet_id};
    return [self POST:@"1.1/favorites/create.json" parameters:parameters success:success failure:failure];
}
//------------------------------------------------------------------------------
- (AFHTTPRequestOperation *) unfavorite_twit_with_id:(NSString *)tweet_id
                                         success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
                                         failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure {
    NSDictionary *parameters = @{@"id": tweet_id};
    return [self POST:@"1.1/favorites/destroy.json" parameters:parameters success:success failure:failure];
}
//------------------------------------------------------------------------------
-(void) load:(void (^)())on_done
{
    if (_twits) {
        on_done();
    }
    else {
        [self reload:^{
            on_done();
        }];
    }
}
//------------------------------------------------------------------------------
-(void) sign_out
{
    [self.requestSerializer removeAccessToken];
}
//------------------------------------------------------------------------------
- (AFHTTPRequestOperation *)retweet_with_id:(NSString *)tweet_id
                                    success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
                                    failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure
{
    return [self POST:[NSString stringWithFormat:@"1.1/statuses/retweet/%@.json", tweet_id]
           parameters:nil
              success:success
              failure:failure];
}
//------------------------------------------------------------------------------
- (AFHTTPRequestOperation *)destroy_with_id:(NSString*)tweet_id
                                  success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
                                  failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure
{
    return [self POST:[NSString stringWithFormat:@"1.1/statuses/destroy/%@.json", tweet_id]
           parameters:nil
              success:success
              failure:failure];
}

@end
