//
//  ProfileViewController.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/13/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *profile_image;
@property (strong, nonatomic) IBOutlet UILabel *user_name;
@property (strong, nonatomic) IBOutlet UILabel *user_handle;
@property (strong, nonatomic) IBOutlet UILabel *tweet_count;
@property (strong, nonatomic) IBOutlet UILabel *followers;
@property (strong, nonatomic) IBOutlet UILabel *following;

@end

@implementation ProfileViewController
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

    
    self.title = @"Profile";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Cancel"
                                                                            style:UIBarButtonItemStylePlain target:self
                                                                           action:@selector(cancel_click)];
    self.navigationItem.rightBarButtonItem = nil;

    
    User* user = _user;
    [self.profile_image setImageWithURL:[NSURL URLWithString:user.profile_url]];
    self.user_handle.text = user.user_handle;
    self.user_name.text = user.name;
    self.tweet_count.text = [NSString stringWithFormat:@"%i", user.status_count];
    self.following.text = [NSString stringWithFormat:@"%i", user.followers];
    self.followers.text = [NSString stringWithFormat:@"%i", user.friends];
}

-(void)cancel_click
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)set_user:(User *)user
{
    _user = user;
}

@end
