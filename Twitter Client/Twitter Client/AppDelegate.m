//
//  AppDelegate.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "AppDelegate.h"
#import "TwitListController.h"
#import "Util.h"
#import "LoginViewController.h"
#import "Twitter.h"
#import "FlipBurgerViewController.h"

@implementation AppDelegate
//------------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(TWITTER_COLOR_HEX)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    [self init_main_window];
    
    [self.window makeKeyAndVisible];

    return YES;
}
//------------------------------------------------------------------------------
-(void) init_main_window
{
//    UIViewController* controller;
//    
//    if ([Twitter instance].is_logged_in) {
//        UIViewController* c = [[TwitListController alloc]initWithNibName:@"TwitListController" bundle:nil];
//        controller = [[UINavigationController alloc]initWithRootViewController:c];
//    }
//    else {
//        controller = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
//    }

    FlipBurgerViewController* c = [FlipBurgerViewController new];
    
    self.window.rootViewController = c;
}
//------------------------------------------------------------------------------
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
//------------------------------------------------------------------------------
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
//------------------------------------------------------------------------------
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
//------------------------------------------------------------------------------
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
//------------------------------------------------------------------------------
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//------------------------------------------------------------------------------
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    Twitter* client = [Twitter instance];
    [client open_url:url withSuccess:^{
        [self init_main_window];
    }];
    return YES;
}
//------------------------------------------------------------------------------
@end
