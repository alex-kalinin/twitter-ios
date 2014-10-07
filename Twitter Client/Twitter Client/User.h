//
//  User.h
//  Twitter Client
//
//  Created by Alex Kalinin on 10/6/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
-(id)initWithDict:(NSDictionary*)dict;

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* thumbnail_url;
//@property (nonatomic, strong) NSString* profile_url;
@property (nonatomic, strong) NSString* banner_url;
@property (nonatomic, strong) NSString* user_handle;

@property (nonatomic) NSDictionary* dict;

@property (nonatomic) int friends;
@property (nonatomic) int followers;
@property (nonatomic) int status_count;

+ (User *)currentUser;
+ (void)setCurrentUser:(User *)user;
+ (void)signOut;
@end
