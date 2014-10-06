//
//  TwitCell.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "TwitCell.h"

@interface TwitCell()
@property (strong, nonatomic) IBOutlet UIImageView *twitImage;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *handle;
@property (strong, nonatomic) IBOutlet UILabel *text;
@property (strong, nonatomic) IBOutlet UILabel *dateStr;

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

-(void)display_twit_with_author:(NSString *)author_handle withName:(NSString *)name withText:(NSString *)text withDateText:(NSString *)date_text
{
//    self.name.text = @"TesterTest Tets";
//    self.handle.text = @"TheTesterTestHandle";
//    self.dateStr.text = @"12/20/14";
//    self.text.text = @"This is a rather long that I need to test how the label will fold or not due to dynamic layouts.";
}

@end
