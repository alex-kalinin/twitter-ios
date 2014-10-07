//
//  User.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/6/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "User.h"
#import "Twitter.h"

@implementation User

static User *_currentuser;

-(id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        self.dict = dict;
        self.name = (NSString *) dict[@"name"];
        self.thumbnail_url = (NSString *) dict[@"profile_image_url"];
        self.banner_url = (NSString *) dict[@"profile_banner_url"];
        self.user_handle = (NSString *) dict[@"screen_name"];
        self.friends = (int) dict[@"friends_count"];
        self.followers = (int) dict[@"followers_count"];
        self.status_count = (int) dict[@"statuses_count"];
    }
    return self;
}


+ (User *)currentUser {
    if (!_currentuser) {
        NSData *userData = [[NSUserDefaults standardUserDefaults] objectForKey:@"twitter_user"];
        if (userData) {
            NSDictionary *user_dict = [NSJSONSerialization JSONObjectWithData:userData options:NSJSONReadingMutableContainers error:nil];
            _currentuser = [[User alloc] initWithDict:user_dict];
        }
    }
    return _currentuser;
}

+ (void)setCurrentUser:(User *)user {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _currentuser = user;
    if (user) {
        NSData *userData = [NSJSONSerialization dataWithJSONObject:user.dict options:NSJSONWritingPrettyPrinted error:nil];
        [defaults setObject:userData forKey:@"twitter_user"];
    } else {
        [defaults removeObjectForKey:@"twitter_user"];
    }
    [defaults synchronize];
}

+ (void)signOut {
    User.currentUser = nil;
    [[[Twitter instance] requestSerializer] removeAccessToken];
}

//+ (void)verifyCurrentUserWithSuccess:(void(^) ())success failure:(void (^) (NSError *error))failure {
//    [[Twitter instance] verifyCredentialWithSuccess:^(AFHTTPRequestOperation *operation, id respond) {
//        NSLog(@"[User] verify user successfully");
//        User *user = [[User alloc] initWithDictionary:respond];
//        [User setCurrentUser:user];
//        if (success) {
//            success();
//        }
//    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"[User] verigy user fail");
//        if (failure) {
//            failure(error);
//        }
//    }];
//}




@end
