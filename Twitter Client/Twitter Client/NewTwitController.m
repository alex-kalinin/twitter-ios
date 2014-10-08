//
//  NewTwitController.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/7/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "NewTwitController.h"
#import "UIImageView+AFNetworking.h"

@interface NewTwitController ()
@property (strong, nonatomic) IBOutlet UIImageView *profile_image;
@property (strong, nonatomic) IBOutlet UILabel *user_name;
@property (strong, nonatomic) IBOutlet UILabel *user_handle;
@property (strong, nonatomic) IBOutlet UITextView *twit_text;

@end
//------------------------------------------------------------------------------
@implementation NewTwitController
{
    User* _author;
}
//------------------------------------------------------------------------------
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Home";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Cancel"
                                                                            style:UIBarButtonItemStylePlain target:self
                                                                           action:@selector(cancel_click)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Send"
                                                                             style:UIBarButtonItemStylePlain target:self

                                                                            action:@selector(send_click)];
    self.user_name.text = _author.name;
    self.user_handle.text = [NSString stringWithFormat:@"@%@", _author.user_handle];
    [self.profile_image setImageWithURL:[NSURL URLWithString:_author.thumbnail_url]];
    self.twit_text.text = @"";
    
    [self.twit_text becomeFirstResponder];
}
//------------------------------------------------------------------------------
-(void)set_user:(User *)author
{
    _author = author;
}
//------------------------------------------------------------------------------
-(void) cancel_click
{
    [self.navigationController popViewControllerAnimated:YES];
}
//------------------------------------------------------------------------------
-(void) send_click
{
    [self.delegate new_twit_controller_done:self withText:self.twit_text.text];
    [self.navigationController popViewControllerAnimated:YES];
}
//------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//------------------------------------------------------------------------------

@end
