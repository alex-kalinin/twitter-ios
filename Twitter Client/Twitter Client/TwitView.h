//
//  TwitView.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Twit;

@interface TwitData : NSObject
@property (nonatomic) BOOL favorited;
@property (nonatomic) long favorites_count;
@property (nonatomic) BOOL retweeted;
@property (nonatomic) long retweet_count;
@end
//------------------------------------------------------------------------------
@protocol TwitView <NSObject>
//------------------------------------------------------------------------------
-(void) display_twit_with_author:(NSString*)author_handle
                        withName:(NSString*)name
                        withText:(NSString*)text
                    withDateText:(NSString*)date_text
                    withImageUrl:(NSString*)imageUrl
                    withTwitData:(TwitData*)twit_data
                        withTwit:(Twit*)twit;
@end
