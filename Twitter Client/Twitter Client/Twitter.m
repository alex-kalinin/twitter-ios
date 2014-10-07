//
//  Twitter.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "Twitter.h"
#import "Twit.h"

NSString* API_KEY = @"7RmP45H9CIzTBFAzNywETt1dw";
NSString* API_SECRET = @"ULTxpra7YVpsSzEd3iZrKhSxmE2tKwXOEITwAiQZiuznaLq6u2";
NSString* BASE_URL = @"https://api.twitter.com";

static Twitter* _twitterClient;

@implementation Twitter
{
    NSArray*    _twits;
}

+(Twitter *)instance
{
    if (!_twitterClient) {
        _twitterClient = [[Twitter alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]
                                                    consumerKey:API_KEY
                                                 consumerSecret:API_SECRET];
    }
    return _twitterClient;
}

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

-(void)open_url:(NSURL *)url
{
    [self fetchAccessTokenWithPath:@"oauth/access_token"
                              method:@"POST"
                        requestToken:[BDBOAuthToken tokenWithQueryString:url.query]
                             success:^(BDBOAuthToken *accessToken) {
                                 
                                 NSLog(@"Got access token");
                                 [self.requestSerializer saveAccessToken:accessToken];
                                 
                                 [self reload:^{}];
                                 
                             } failure:^(NSError *error) {
                                 NSLog(@"Fail to get access token");
                             }];

}

-(NSArray*) load_twits_from_json:(NSArray*) json
{
    NSMutableArray* result = [NSMutableArray new];
    
    for (NSDictionary* twit_dict in json) {
        Twit* twit = [[Twit alloc]initWithDict:twit_dict];
        [result addObject:twit];
    }
    return result;
}

-(unsigned long)get_twit_count
{
    return _twits.count;
}

-(Twit *)twit_at_index:(unsigned long)index
{
    return _twits[index];
}

-(BOOL)is_logged_in
{
    return self.requestSerializer.accessToken;
}

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

@end
