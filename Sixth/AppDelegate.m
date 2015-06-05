//
//  AppDelegate.m
//  Sixth
//
//  Created by 曹凯 on 15/4/24.
//  Copyright (c) 2015年 CK. All rights reserved.
//

#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>
#import "LoginViewController.h"

#define AVOSCloudAppID  @"a1ie93rls0njtngql4vwpqj574csgp1brqv1tkk0gjx6kjdi"
#define AVOSCloudAppKey @"q9s6q0f5uaj55na15o9jxh4iwjk9v59hwo90roy7dqkye6m5"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible ];
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *rootNC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = rootNC;
    
    //如果使用美国站点，请加上这行代码 [AVOSCloud useAVCloudUS];
    //设置AVOSCloud
    [AVOSCloud setApplicationId:AVOSCloudAppID
                      clientKey:AVOSCloudAppKey];
    //统计应用启动情况
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    /* 重要! 注册子类 App生命周期内 只需要执行一次即可*/
#warning 为了引起你的注意! 如果明白了用法可以删除这行
//    [Student registerSubclass];
    //
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
