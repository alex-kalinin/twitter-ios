//
//  TwitView.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TwitView <NSObject>

-(void) display_twit_with_author:(NSString*)author_handle
                        withName:(NSString*)name
                        withText:(NSString*)text
                    withDateText:(NSString*)date_text
                    withImageUrl:(NSString*)imageUrl;
@end
