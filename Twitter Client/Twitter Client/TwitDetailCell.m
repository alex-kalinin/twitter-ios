//
//  TwitDetailCell.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/8/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "TwitDetailCell.h"
#import "UIImageView+AFNetworking.h"
#import "Twit.h"
#import "NSDate+DateTools.h"

@interface TwitDetailCell()
@property (strong, nonatomic) IBOutlet UIImageView *profile_image;
@property (strong, nonatomic) IBOutlet UILabel *user_name;
@property (strong, nonatomic) IBOutlet UILabel *user_handle;
@property (strong, nonatomic) IBOutlet UILabel *tweet_text;
@property (strong, nonatomic) IBOutlet UILabel *tweet_date;

@end

@implementation TwitDetailCell
//------------------------------------------------------------------------------
- (void)awakeFromNib
{
    // Initialization code
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
    [self.profile_image setImageWithURL:[NSURL URLWithString:imageUrl]];
    self.user_name.text = name;
    self.user_handle.text = author_handle;
    self.tweet_text.text = text;
    self.tweet_date.text = [twit_data.tweet_date formattedDateWithFormat:@"MM/d/yyyy hh:mm a"];
}

@end
