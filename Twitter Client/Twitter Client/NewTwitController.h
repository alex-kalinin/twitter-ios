//
//  NewTwitController.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/7/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Twit.h"

@class NewTwitController;

@protocol NewTwitControllerDelegate<NSObject>
-(void) new_twit_controller_done:(NewTwitController*) twc
                        withText:(NSString*)text
                     withReplyID:(NSString*)reply_id;

-(void) new_twit_controller_profile_image_click:(NewTwitController*) twc;
@end

@interface NewTwitController : UIViewController<UITextViewDelegate>
@property (nonatomic) id<NewTwitControllerDelegate> delegate;

-(void)set_user:(User*)author;
-(void)set_user:(User*)author withTweet:(Twit*)tweet;
@end
