//
//  Twitter.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BDBOAuth1RequestOperationManager.h"
#import "Twit.h"
#import "User.h"

@interface Twitter : BDBOAuth1RequestOperationManager
+(Twitter*) instance;
-(void) login;
-(void) open_url:(NSURL*)url withSuccess:(void(^)())on_done;
@property (nonatomic, readonly, getter = get_twit_count) unsigned long twit_count;
-(Twit*)twit_at_index:(unsigned long) index;
-(BOOL) is_logged_in;

-(void) load:(void(^)()) on_done;
-(void) reload:(void (^)())on_done;
-(void)sign_out;

-(void) twit_with_text:(NSString*)text
           withReplyID:(NSString*)reply_id
               success:(void(^)(Twit*))on_success;

-(long) index_for_tweet:(Twit*)tweet;

-(void)set_mentions_mode:(BOOL)mentions_mode;
-(void) load_user:(NSString*)screen_name success:(void(^)(User*))on_success;

@property (nonatomic, readonly, getter = get_mode_display_name) NSString* mode_display_name;


-(AFHTTPRequestOperation *) favorite_twit_with_id:(NSString*)tweet_id
    success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;
- (AFHTTPRequestOperation *) unfavorite_twit_with_id:(NSString *)id
success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)retweet_with_id:(NSString *)tweet_id
                                  success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)destroy_with_id:(NSString*)tweet_id
                                    success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
                                    failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

@end
