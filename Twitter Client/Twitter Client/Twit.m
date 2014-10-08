//
//  Twit.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "Twit.h"
#import "User.h"
#import "Twitter.h"
#import "NSDate+DateTools.h"

static NSDateFormatter* _formatter;
//------------------------------------------------------------------------------
@interface Twit()
@property (nonatomic, readonly, getter = get_date_formatter) NSDateFormatter* date_formatter;
@end
//------------------------------------------------------------------------------
@implementation Twit
{
//    User*   _user;
    NSString*   _user_handle;
    NSString*   _user_name;
    NSString*   _user_profile_url;
    NSString*   _text;
    NSString*   _create_at_string;
    NSDate*     _create_at;
    BOOL        _favorited;
    Twitter*    _twitter;
    NSString*   _id;
}
//------------------------------------------------------------------------------
-(NSDateFormatter*)get_date_formatter
{
    if (!_formatter) {
        _formatter = [NSDateFormatter new];
        _formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";;
    }
    return _formatter;
}
//------------------------------------------------------------------------------
- (instancetype)initWithDict:(NSDictionary *)dict withTwitter:(Twitter*)twitter
{
    self = [super init];
    if (self) {
        _twitter = twitter;
        
        NSDictionary* user_dict = dict[@"user"];

        _user_handle = user_dict[@"screen_name"];
        _user_name = user_dict[@"name"];
        _user_profile_url = user_dict[@"profile_image_url"];
        
        _text = dict[@"text"];
        _create_at_string = dict[@"created_at"];
        _create_at = [self.date_formatter dateFromString:_create_at_string];
        
        _favorited = [dict[@"favorited"] boolValue];
        _id = dict[@"id"];
    }
    return self;
}
//------------------------------------------------------------------------------
-(void)display:(id<TwitView>)view
{
    TwitData* data = [TwitData new];
    data.favorited = _favorited;
    
    NSString* date_str = _create_at.shortTimeAgoSinceNow;
    
    [view display_twit_with_author:_user_handle
                          withName:_user_name
                        withText:_text
                      withDateText:date_str
                      withImageUrl:_user_profile_url
                       withTwitData:data
                          withTwit:self];
}
//------------------------------------------------------------------------------
-(void) toggle_favorite
{
    _favorited = !_favorited;
    
    if (_favorited) {
        [_twitter favorite_twit_with_id:_id success:nil failure:nil];
    }
    else {
        [_twitter unfavorite_twit_with_id:_id success:nil failure:nil];
    }
}
@end
