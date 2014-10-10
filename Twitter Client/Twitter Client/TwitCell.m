//
//  TwitCell.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "Util.h"
#import "TwitCell.h"
#import "Twit.h"
#import "MyLabel.h"
#import "UIImageView+AFNetworking.h"
#import "ButtonBarController.h"

@interface TwitCell()
@property (strong, nonatomic) IBOutlet UIImageView *twitImage;
@property (strong, nonatomic) IBOutlet MyLabel *name;
@property (strong, nonatomic) IBOutlet MyLabel *handle;
@property (strong, nonatomic) IBOutlet MyLabel *text;
@property (strong, nonatomic) IBOutlet MyLabel *dateStr;
@property (strong, nonatomic) IBOutlet UIButton *reply_button;
@property (strong, nonatomic) IBOutlet UIButton *retweet_button;
@property (strong, nonatomic) IBOutlet UIButton *favorite_button;
@property (strong, nonatomic) IBOutlet UILabel *retweet_count;
@property (strong, nonatomic) IBOutlet UILabel *star_count;

@end

@implementation TwitCell
{
    Twit*   _twit;
    ButtonBarController*    _button_bar;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)display_twit_with_author:(NSString *)author_handle
                       withName:(NSString *)name
                       withText:(NSString *)text
                   withDateText:(NSString *)date_text
                   withImageUrl:(NSString*)imageUrl
                   withTwitData:(TwitData *)twit_data
                       withTwit:(Twit*)twit
{
    UIColor* orange = UIColorFromRGB(0xffac33);
    UIColor* gray = [UIColor darkGrayColor];
    UIColor* green = UIColorFromRGB(0x5c913b);
    
    _twit = twit;
    self.name.text = name;
    self.handle.text = [NSString stringWithFormat:@"@%@", author_handle];
    self.dateStr.text = date_text;
    self.text.text = text;
    [self.twitImage setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    self.star_count.text = [NSString stringWithFormat:@"%li", twit_data.favorites_count];
    self.retweet_count.text = [NSString stringWithFormat:@"%li", twit_data.retweet_count];

    [self.favorite_button setImage:[UIImage imageNamed:
                                    (twit_data.favorited ? @"StarSelected" : @"Star")]
                          forState:UIControlStateNormal];
    self.star_count.textColor = twit_data.favorited ? orange : gray;

    
    [self.retweet_button setImage:[UIImage imageNamed:(twit_data.retweeted ? @"RetweetSelected" : @"Retwit")]
                         forState:UIControlStateNormal];
    self.retweet_count.textColor = twit_data.retweeted ? green : gray;
    
    _button_bar = [[ButtonBarController alloc]init_with_tweet:_twit withTweetView:self];
}

- (IBAction)favorite_button_click:(id)sender
{
    [_button_bar favorite_button_click:sender];
}

- (IBAction)retweet_button_click:(id)sender
{
    [_button_bar retweet_button_click:sender];
}

- (IBAction)reply_click:(id)sender
{
    [self.delegate reply_click:_twit];
}


@end
