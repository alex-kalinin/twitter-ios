//
//  FlipBurgerViewController.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/13/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "FlipBurgerViewController.h"
#import "TwitListController.h"
#import "LoginViewController.h"
#import "Twitter.h"
#import "MenuViewController.h"
#import "User.h"
#import "ProfileViewController.h"

@interface FlipBurgerViewController ()
@property (strong, nonatomic) IBOutlet UIView *content_view;

@end

@implementation FlipBurgerViewController
{
    TwitListController*     _timeline_controller;
    LoginViewController*    _login_controller;
    UINavigationController* _nav_controller;
    Twitter*                _twitter;
    MenuViewController*     _menu_controller;
    ProfileViewController*  _profile_controller;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _twitter = [Twitter instance];
    
    _login_controller = [LoginViewController new];
    _timeline_controller = [TwitListController new];
    _nav_controller = [[UINavigationController alloc]initWithRootViewController:_timeline_controller];
    _menu_controller = [MenuViewController new];

    _profile_controller = [ProfileViewController new];
    
    _timeline_controller.delegate = self;
    _menu_controller.delegate = self;
    
    if (_twitter.is_logged_in) {
        [self show_timeline];
    }
    else {
        [self show_login];
    }
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void) show_timeline
{
    [_login_controller removeFromParentViewController];
    [_login_controller.view removeFromSuperview];
    
    
    [_content_view addSubview:_menu_controller.view];
    [self addChildViewController:_menu_controller];
    [_menu_controller didMoveToParentViewController:self];
    
    [_content_view addSubview:_nav_controller.view];
    [self addChildViewController:_nav_controller];
    [_nav_controller didMoveToParentViewController:self];
}

-(void) show_login
{
    [_nav_controller removeFromParentViewController];
    [_nav_controller.view removeFromSuperview];
    
    [_content_view addSubview:_login_controller.view];
    [self addChildViewController:_login_controller];
    [_login_controller didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)menu_click:(TwitListController*)sender
{
    [_menu_controller set_user:[User currentUser]];
    [self toggle_menu:nil];
}

-(void) toggle_menu:(void(^)()) on_done
{
    [UIView animateWithDuration:.4 animations:^{
        
        CGRect frame = _nav_controller.view.frame;
        frame.origin.x = frame.origin.x <= 0 ? 270 : 0;
        _nav_controller.view.frame = frame;
        
    } completion:^(BOOL finished) {
        if (on_done) on_done();
    }];
}

-(void)menu_mentions_click:(MenuViewController *)sender
{
    [_twitter set_mentions_mode:YES];
    [_timeline_controller reload];
    [self toggle_menu:nil];
}

-(void)menu_profile_click:(MenuViewController *)sender
{
    [self addChildViewController:_profile_controller];
    [_profile_controller didMoveToParentViewController:self];
    [_profile_controller set_user:[User currentUser]];

    [self toggle_menu:^{
        [_nav_controller pushViewController:_profile_controller animated:NO];
    }];
}

-(void)menu_sign_out_click:(MenuViewController *)sender
{
    [_twitter sign_out];
    [self toggle_menu:^{
        [self show_login];
    }];
}

-(void)menu_timeline_click:(MenuViewController *)sender
{
    [_twitter set_mentions_mode:NO];
    [_timeline_controller reload];
    [self toggle_menu:nil];
}

@end
