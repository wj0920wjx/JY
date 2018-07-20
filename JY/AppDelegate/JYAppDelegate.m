//
//  AppDelegate.m
//  JY
//
//  Created by 王杰 on 2018/6/14.
//  Copyright © 2018年 极限交友. All rights reserved.
//

#import "JYAppDelegate.h"
#import "JYTabViewController.h"
#import <NIMSDK/NIMSDK.h>

#define NIMAPPKEY @"067962725ba522e7ecb405a63f3a9292"
#define JYPUSHDEV @"JYPushdev"
#define JYPUSHDIS @"JYPushdis"

@interface JYAppDelegate ()

@end

@implementation JYAppDelegate

- (UIWindow *)window
{
    if(!_window)
    {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor RandomColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.rootViewController = [[JYTabViewController alloc] init];
    
    //推荐在程序启动的时候初始化 NIMSDK
    NSString *appKey        = NIMAPPKEY;
    NIMSDKOption *option    = [NIMSDKOption optionWithAppKey:appKey];
    
#ifdef DEBUG
    option.apnsCername      = JYPUSHDEV;
#else
    option.apnsCername      = JYPUSHDIS;
#endif
    
    option.pkCername        = nil;
    
    [[NIMSDK sharedSDK] registerWithOption:option];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
