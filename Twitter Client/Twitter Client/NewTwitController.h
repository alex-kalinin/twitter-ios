//
//  NewTwitController.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/7/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@class NewTwitController;

@protocol NewTwitControllerDelegate<NSObject>
-(void) new_twit_controller_done:(NewTwitController*) twc
                        withText:(NSString*)text;
@end

@interface NewTwitController : UIViewController<UITextViewDelegate>
@property (nonatomic) id<NewTwitControllerDelegate> delegate;
-(void)set_user:(User*)author;
@end
