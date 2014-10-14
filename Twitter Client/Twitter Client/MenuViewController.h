//
//  MenuViewController.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/13/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@class MenuViewController;

@protocol MenuViewControllerDelegate <NSObject>
-(void)menu_profile_click:(MenuViewController*)sender;
-(void)menu_timeline_click:(MenuViewController*)sender;;
-(void)menu_mentions_click:(MenuViewController*)sender;
-(void)menu_sign_out_click:(MenuViewController*)sender;
@end

@interface MenuViewController : UIViewController
@property (nonatomic, weak) id<MenuViewControllerDelegate> delegate;
-(void) set_user:(User*)user;
@end
