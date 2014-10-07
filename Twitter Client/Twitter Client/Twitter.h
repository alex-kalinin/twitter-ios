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
-(void) open_url:(NSURL*)url;
@property (nonatomic, readonly, getter = get_twit_count) unsigned long twit_count;
-(Twit*)twit_at_index:(unsigned long) index;
-(BOOL) is_logged_in;

-(void) load:(void(^)()) on_done;
@end
