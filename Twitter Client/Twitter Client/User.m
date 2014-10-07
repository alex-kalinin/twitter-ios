//
//  User.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/6/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "User.h"

@implementation User
{
    NSString*   _name;
    NSString*   _screen_name;
    NSString*   _profile_image_url;
    NSString*   _tag_line;
    NSDictionary*   _dict;
}



-(id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _name = dict[@"name"];
        _screen_name = dict[@"screen_name"];
        _profile_image_url = dict[@"profile_image_url"];
        _tag_line = dict[@"description"];
        _dict = dict;
    }
    return self;
}

@end
