//
//  TweetDetailRetweetsCell.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/8/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "TweetDetailRetweetsCell.h"

@interface TweetDetailRetweetsCell()
@property (strong, nonatomic) IBOutlet UILabel *retweet_count;
@property (strong, nonatomic) IBOutlet UILabel *favorite_count;

@end

@implementation TweetDetailRetweetsCell

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
                   withImageUrl:(NSString *)imageUrl
                   withTwitData:(TwitData *)twit_data
                       withTwit:(Twit *)twit
{
    self.retweet_count.text = [NSString stringWithFormat:@"%li", twit_data.retweet_count];
    self.favorite_count.text = [NSString stringWithFormat:@"%li", twit_data.favorites_count];
}

@end
