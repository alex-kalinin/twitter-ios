//
//  ButtonBarController.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/8/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Twit.h"
#import "TwitView.h"

@interface ButtonBarController : NSObject
- (id) init_with_tweet:(Twit*)tweet withTweetView:(id<TwitView>)view;
- (IBAction)favorite_button_click:(id)sender;
- (IBAction)retweet_button_click:(id)sender;
- (IBAction)reply_button_click:(id)sender;

@end
