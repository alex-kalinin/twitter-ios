//
//  LoginViewController.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/6/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "LoginViewController.h"
#import "Twitter.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login_with_twitter_click:(id)sender {
    Twitter* client = [Twitter instance];
    [client login];
}

@end
