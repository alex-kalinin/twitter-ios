//
//  NewTwitController.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/7/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "NewTwitController.h"
#import "UIImageView+AFNetworking.h"
#import "UIPlaceHolderTextView.h"
#import "Util.h"

@interface NewTwitController ()
@property (strong, nonatomic) IBOutlet UIImageView *profile_image;
@property (strong, nonatomic) IBOutlet UILabel *user_name;
@property (strong, nonatomic) IBOutlet UILabel *user_handle;
@property (strong, nonatomic) IBOutlet UIPlaceHolderTextView *twit_text;

@end
//------------------------------------------------------------------------------
@implementation NewTwitController
{
    User* _author;
    UILabel* _remain_count;
    UIBarButtonItem*    _remain_button;
    NSString*   _default_text;
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
    self.title = @"";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Cancel"
                                                                            style:UIBarButtonItemStylePlain target:self
                                                                           action:@selector(cancel_click)];
    
    UIBarButtonItem* send_button = [[UIBarButtonItem alloc]initWithTitle:@"Send"
                                                                             style:UIBarButtonItemStylePlain target:self

                                                                            action:@selector(send_click)];

//    _remain_count = [[UIBarButtonItem alloc]initWithTitle:@"140"
//                                                                    style:UIBarButtonItemStylePlain
//                                                                   target:self
//                                                                   action:nil];
//    [_remain_count setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    
    _remain_count = [[UILabel alloc]init];
    _remain_count.text = @"140  ";
    _remain_count.textColor = [UIColor whiteColor];
    [_remain_count setFont:[UIFont systemFontOfSize:12]];
    _remain_count.numberOfLines = 1;
    _remain_count.textAlignment = NSTextAlignmentRight;
    [_remain_count sizeToFit];
    
    _remain_button = [[UIBarButtonItem alloc]initWithCustomView:_remain_count];
    
    self.navigationItem.rightBarButtonItems = @[send_button, _remain_button];
//    self.navigationItem.rightBarButtonItem = _remain_button;
    
    self.user_name.text = _author.name;
    self.user_handle.text = [NSString stringWithFormat:@"@%@", _author.user_handle];
    [self.profile_image setImageWithURL:[NSURL URLWithString:_author.thumbnail_url]];
    
    [self.twit_text becomeFirstResponder];

    if (_default_text.length <= 0) {
        self.twit_text.placeholder = @"What's happening?";
        self.twit_text.placeholderColor = [UIColor lightGrayColor];
        self.twit_text.delegate = self;
    }
    
    self.twit_text.text = _default_text;
}
//------------------------------------------------------------------------------
-(void)set_user:(User *)author
{
    _author = author;
}
//------------------------------------------------------------------------------
-(void)set_user:(User *)author withText:(NSString *)text
{
    [self set_user:author];
    _default_text = text;
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
-(void)textViewDidChange:(UITextView *)textView
{
    _remain_count.text = [NSString stringWithFormat:@"%i  ", (int) (140 - textView.text.length)];
}

@end
