//
//  AppDelegate.m
//  03-BDNMProject
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "AppDelegate.h"
#import "BNTabbarViewController.h"

@interface AppDelegate ()

@end

/*
 注意：设置app名字，只需要在info.plist里面添加一个健为Bundle display name就可以。
 */

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.backgroundColor = [UIColor whiteColor];

    
    /**
     *  1.初始化窗口根控制器
     */
    [self initWindowRootViewControlller];
    
    /**
     *  2.配置navigationBar样式
     */
    [self navigationBarThemeConfig];
    
    /**
     *  3.配置tabbar样式
     */
    [self tabbarThemeConfig];
    
    return YES;
}

/**
 *  配置tabbar
 */
- (void)tabbarThemeConfig
{
    //设置tabbar背景颜色
    //[[UITabBar appearance] setBarTintColor:[UIColor redColor]];
    
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
}

/**
 *  配置navigationBar
 */
- (void)navigationBarThemeConfig
{
    //[[UINavigationBar appearance] setTintColor:[UIColor redColor]];
}

/**
 *  初始化窗口根控制器
 */
- (void)initWindowRootViewControlller
{
    BNTabbarViewController *tabbarViewController = [[BNTabbarViewController alloc] init];
    
    self.window.rootViewController = tabbarViewController;
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
