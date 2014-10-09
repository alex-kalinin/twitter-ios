//
//  TwitListController.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewTwitController.h"
#import "TweetDetailController.h"

@interface TwitListController : UIViewController<UITableViewDelegate, UITableViewDataSource, NewTwitControllerDelegate, TweetDetailControllerDelegate>

@end
