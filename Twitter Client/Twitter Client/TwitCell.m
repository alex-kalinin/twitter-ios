//
//  TwitCell.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "TwitCell.h"
#import "MyLabel.h"
#import "UIImageView+AFNetworking.h"

@interface TwitCell()
@property (strong, nonatomic) IBOutlet UIImageView *twitImage;
@property (strong, nonatomic) IBOutlet MyLabel *name;
@property (strong, nonatomic) IBOutlet MyLabel *handle;
@property (strong, nonatomic) IBOutlet MyLabel *text;
@property (strong, nonatomic) IBOutlet MyLabel *dateStr;

@end

@implementation TwitCell

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
{
    self.name.text = author_handle;
    self.handle.text = name;
    self.dateStr.text = date_text;
    self.text.text = text;
    [self.twitImage setImageWithURL:[NSURL URLWithString:imageUrl]];
}

@end
