//
//  TwitCell.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "TwitCell.h"
#import "Twit.h"
#import "MyLabel.h"
#import "UIImageView+AFNetworking.h"

@interface TwitCell()
@property (strong, nonatomic) IBOutlet UIImageView *twitImage;
@property (strong, nonatomic) IBOutlet MyLabel *name;
@property (strong, nonatomic) IBOutlet MyLabel *handle;
@property (strong, nonatomic) IBOutlet MyLabel *text;
@property (strong, nonatomic) IBOutlet MyLabel *dateStr;
@property (strong, nonatomic) IBOutlet UIButton *reply_button;
@property (strong, nonatomic) IBOutlet UIButton *retweet_button;
@property (strong, nonatomic) IBOutlet UIButton *favorite_button;

@end

@implementation TwitCell
{
    Twit*   _twit;
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
    _twit = twit;
    self.name.text = name;
    self.handle.text = [NSString stringWithFormat:@"@%@", author_handle];
    self.dateStr.text = date_text;
    self.text.text = text;
    [self.twitImage setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    if (twit_data.favorited) {
        [self.favorite_button setImage:[UIImage imageNamed:@"StarSelected"] forState:UIControlStateNormal];
    }
    else {
        [self.favorite_button setImage:[UIImage imageNamed:@"Star"] forState:UIControlStateNormal];
    }
}

- (IBAction)favorite_button_click:(id)sender {
    [_twit toggle_favorite];
    [_twit display:self];
}

@end
