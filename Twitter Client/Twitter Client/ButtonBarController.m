//
//  ButtonBarController.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/8/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "ButtonBarController.h"

@implementation ButtonBarController
{
    Twit*   _tweet;
    id<TwitView>    _view;
}

-(id) init_with_tweet:(Twit*)tweet withTweetView:(id<TwitView>)view
{
    self = [super self];
    _tweet = tweet;
    _view = view;
    return self;
}

- (IBAction)favorite_button_click:(id)sender
{
    [_tweet toggle_favorite];
    [_tweet display:_view];
}

- (IBAction)retweet_button_click:(id)sender
{
    [_tweet toggle_retweet];
    [_tweet display:_view];
}

- (IBAction)reply_button_click:(id)sender
{
}

@end
