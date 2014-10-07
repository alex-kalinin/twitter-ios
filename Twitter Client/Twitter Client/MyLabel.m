//
//  MyLabel.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/6/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel
//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//------------------------------------------------------------------------------
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.numberOfLines == 0) {
        if (self.preferredMaxLayoutWidth != self.frame.size.width) {
            self.preferredMaxLayoutWidth = self.frame.size.width;
            [self setNeedsUpdateConstraints];
        }
    }
}
//------------------------------------------------------------------------------
-(CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    if (self.numberOfLines == 0) {
        size.height += 1;
    }
    return size;
}
@end
