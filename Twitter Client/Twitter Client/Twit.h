//
//  Twit.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwitView.h"

@interface Twit : NSObject
-(id)initWithDict:(NSDictionary*)dict;
-(void)display:(id<TwitView>) view;
@end
