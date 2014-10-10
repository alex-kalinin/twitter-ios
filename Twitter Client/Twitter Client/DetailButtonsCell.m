//
//  DetailButtonsCell.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/8/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "DetailButtonsCell.h"
#import "ButtonBarController.h"
#import "Util.h"
#import "NewTwitController.h"

@interface DetailButtonsCell()
@property (strong, nonatomic) IBOutlet UIButton *reply_button;
@property (strong, nonatomic) IBOutlet UIButton *retweet_button;
@property (strong, nonatomic) IBOutlet UIButton *favorite_button;
@property (strong, nonatomic) IBOutlet UILabel *retweet_count;
@property (strong, nonatomic) IBOutlet UILabel *favorites_count;

@end
//------------------------------------------------------------------------------
@implementation DetailButtonsCell
{
    ButtonBarController*    _button_bar;
    Twit*                   _tweet;
    NSString*               _author_handle;
}
//------------------------------------------------------------------------------
- (void)awakeFromNib
{
}
//------------------------------------------------------------------------------
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}
//------------------------------------------------------------------------------
-(void)display_twit_with_author:(NSString *)author_handle
                       withName:(NSString *)name
                       withText:(NSString *)text
                   withDateText:(NSString *)date_text
                   withImageUrl:(NSString *)imageUrl
                   withTwitData:(TwitData *)twit_data
                       withTwit:(Twit *)twit
{
    _button_bar = [[ButtonBarController alloc]init_with_tweet:twit withTweetView:self];
    
    UIColor* orange = UIColorFromRGB(0xffac33);
    UIColor* gray = [UIColor darkGrayColor];
    UIColor* green = UIColorFromRGB(0x5c913b);
    
    self.favorites_count.text = [NSString stringWithFormat:@"%li", twit_data.favorites_count];
    self.retweet_count.text = [NSString stringWithFormat:@"%li", twit_data.retweet_count];
    
    [self.favorite_button setImage:[UIImage imageNamed:
                                    (twit_data.favorited ? @"StarSelected" : @"Star")]
                          forState:UIControlStateNormal];
    self.favorites_count.textColor = twit_data.favorited ? orange : gray;
    
    
    [self.retweet_button setImage:[UIImage imageNamed:(twit_data.retweeted ? @"RetweetSelected" : @"Retwit")]
                         forState:UIControlStateNormal];
    self.retweet_count.textColor = twit_data.retweeted ? green : gray;
    
    _tweet = twit;
    _author_handle = author_handle;
}
//------------------------------------------------------------------------------
- (IBAction)reply_click:(id)sender {
    [self.parent reply];
}
//------------------------------------------------------------------------------
- (IBAction)retweet_click:(id)sender {
    [_button_bar retweet_button_click:sender];
}
//------------------------------------------------------------------------------
- (IBAction)favorite_click:(id)sender {
    [_button_bar favorite_button_click:sender];
}

@end
