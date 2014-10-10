//
//  DetailButtonsCell.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/8/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitView.h"
#import "NewTwitController.h"
#import "TweetDetailController.h"

@interface DetailButtonsCell : UITableViewCell<TwitView>
@property (nonatomic, strong) TweetDetailController* parent;
@end
