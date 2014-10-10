//
//  TweetDetailController.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/8/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Twit.h"

@class TweetDetailController;

@protocol TweetDetailControllerDelegate<NSObject>
-(void) tweet_detail_controller_done:(TweetDetailController*)td withTweet:(Twit*)tweet withReply:(BOOL)reply;
@end


@interface TweetDetailController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) id<TweetDetailControllerDelegate> delegate;
-(void) set_tweet:(Twit*)twit;
-(void) reply;
@end
