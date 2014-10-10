//
//  TwitCell.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitView.h"

@protocol TweetCellDelegate <NSObject>

-(void)reply_click:(Twit*)tweet;

@end

@interface TwitCell : UITableViewCell<TwitView>
@property (nonatomic) id<TweetCellDelegate> delegate;
@end
