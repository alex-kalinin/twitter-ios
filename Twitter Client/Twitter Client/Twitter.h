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

-(void) twit_with_text:(NSString*)text success:(void(^)(Twit*))on_success;

-(AFHTTPRequestOperation *) favorite_twit_with_id:(NSString*)id
    success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;
- (AFHTTPRequestOperation *) unfavorite_twit_with_id:(NSString *)id
success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

@end
