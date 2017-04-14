//
//  AppDelegate.m
//  02-RemoteNotification
//
//  Created by vera on 16/7/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"

@interface AppDelegate (){

    BOOL _flag;
}

@end

@implementation AppDelegate

/**
 程序在前台：此方法会触发
 程序在后台：当点击消息会触发，当点击icon进入不会
 程序关闭：此方法在点击icon或者点击消息都不会触发
 */
/**
 *  收到远程推送会触发
 *
 *  @param application <#application description#>
 *  @param userInfo    <#userInfo description#>
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    /*
     服务器格式是固定的：推送的内容不能超过255字节
     {"aps":{"alert":"推送的内容","badge":徽标,"sound": "default"}}
     */
    
    NSString *body = userInfo[@"aps"][@"alert"];
    
    [[[UIAlertView alloc] initWithTitle:@"action" message:body delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    
    //进入详情(注意：在前台不需要处理 -> 通过"已经进入前台"和"已经进入后台"两个代理方法来判断)
    if (userInfo[@"aps"][@"id"] && _flag == NO)
    {
        DetailViewController *detailVC = [[DetailViewController alloc] init];
        
        //detailVC.newsId = userInfo[@"aps"][@"id"];
        
        UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
        
        [nav pushViewController:detailVC animated:YES];
    }
}

/**
 *  注册
 */
- (void)registerRemoteNotification
{
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        //设置类型
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        
        //注册类型
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
        //注册远程推送，会触发代理方法(走"获取到token"和"不支持远程推送"两方法中的一个)
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert];
    }
}

/**
 *  获取到token
 *
 *  @param application <#application description#>
 *  @param deviceToken <#deviceToken description#>
 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //deviceToken：64位，NSData类型
    NSLog(@"获取到token = %@",deviceToken);
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"])
    {
        //去掉token的中"<>"和空格
        NSString *deviceTokenStr = [[NSString alloc] initWithFormat:@"%@",deviceToken];
        
        deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@"<" withString:@""];
        deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@">" withString:@""];
        deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSLog(@"deviceTokenStr = %@",deviceTokenStr);
        
#if 0
        //POST提交到应用程序服务器
        /*
         http://qianfeng.com/index/token.php
         deviceToken：字符串
         */
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@""]];
        
        [request setHTTPMethod:@"POST"];
        
        //把参数添加到请求体里面
        [request setHTTPBody:[@"deviceToken=xxxxxx" dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            //表示上传成功
            if (!error && data[@"status"] == 1) {
                
                [[NSUserDefaults standardUserDefaults] setObject:@"deviceToken" forKey:@"deviceToken"];
            }
            
        }];
#endif
        
    }
}

/**
 *  不支持远程推送
 *
 *  @param application   <#application description#>
 *  @param application   <#application description#>
 *  @param application   <#application description#>
 *  @param launchOptions <#launchOptions description#>
 */
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"当前设备不支持远程推送，error = %@",error);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //当程序关闭后，有远程推送消息发过来，点击消息时，launchOptions就是消息内容
    if (launchOptions)
    {
        //NSString *body = launchOptions[@"aps"][@"alert"];
        
        [[[UIAlertView alloc] initWithTitle:@"action" message:[launchOptions description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        
        //这里也要进入详情(参照上面)
    }
    
    [self registerRemoteNotification];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    _flag = NO;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    _flag = YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
