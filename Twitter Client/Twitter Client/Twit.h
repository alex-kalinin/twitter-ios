//
//  Twit.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwitView.h"

@class Twitter;

@interface Twit : NSObject
-(id)initWithDict:(NSDictionary*)dict withTwitter:(Twitter*)twitter;

-(void)display:(id<TwitView>) view;

-(void) toggle_favorite;
-(void) toggle_retweet;

@property (nonatomic, readonly, getter = get_user_handle) NSString* user_handle;
@property (nonatomic, readonly, getter = get_id) NSString* id;

@end

