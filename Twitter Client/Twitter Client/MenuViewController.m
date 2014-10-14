//
//  MenuViewController.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/13/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "MenuViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@interface MenuViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *profile_image;
@property (strong, nonatomic) IBOutlet UILabel *user_name;
@property (strong, nonatomic) IBOutlet UILabel *user_hanhdle;

@end

@implementation MenuViewController
{
    User* _user;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)profile_click:(id)sender {
    [self.delegate menu_profile_click:self];
}

- (IBAction)timeline_click:(id)sender {
    [self.delegate menu_timeline_click:self];
}

- (IBAction)mentions_click:(id)sender {
    [self.delegate menu_mentions_click:self];
}

- (IBAction)sign_out_click:(id)sender {
    [self.delegate menu_sign_out_click:self];
}

-(void)set_user:(id)user
{
    _user = user;
    [self.profile_image setImageWithURL:[NSURL URLWithString:_user.thumbnail_url]];
    self.user_name.text = _user.name;
    self.user_hanhdle.text = _user.user_handle;
}

@end
