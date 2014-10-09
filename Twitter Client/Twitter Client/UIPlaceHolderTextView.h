//
//  UIPlaceHolderTextView.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/8/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end