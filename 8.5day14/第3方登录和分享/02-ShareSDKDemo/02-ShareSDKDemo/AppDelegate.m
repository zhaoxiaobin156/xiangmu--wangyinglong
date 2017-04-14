//
//  AppDelegate.m
//  02-ShareSDKDemo
//
//  Created by vera on 16/8/5.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

//腾讯开放平台(对应QQ和QQ空间)SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 *  配置ShareSDK
 */
- (void)configShareSDK
{
    /**
     *  设置ShareSDK的AppKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册
     
     *  在将生成的AppKey传入到此方法中
     
     *  方法中的第二个第三个参数为需要连接社交平台SDK时触发
     
     *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息
     
     *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK
     */
    [ShareSDK registerApp:@"iosv1101" activePlatforms:@[@(SSDKPlatformTypeSinaWeibo),@(SSDKPlatformTypeWechat),@(SSDKPlatformTypeQQ),@(SSDKPlatformTypeTencentWeibo)] onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 
                 //链接微信API已供ShareSDK可以正常使用微信的相关功能（授权、分享）
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
                 
             case SSDKPlatformTypeQQ:
                 
                 //连接QQAPI以供ShareSDK可以正常使用QQ或者QQ空间客户端来授权或者分享内容
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
                 
             case SSDKPlatformTypeSinaWeibo:
                 
                 //连接微博API以供ShareSDK可以使用微博客户端来分享内容，不调用此方法也不会影响应用内分享、授权等相关功能
                 //注意：目前的新浪微博SDK需要在项目的Build Settings中的Other Linker Flags添加”-ObjC”(添加了就可以识别静态库外面的类别方法)，如果不配置有可能会崩溃
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
                 
             default:
                 break;
         }
     } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         switch (platformType)
         {
                 /**
                  *  所有支持的平台，都需要去对应开放平台去注册app
                  */
             case SSDKPlatformTypeSinaWeibo:
                 
                 //设置新浪微博应用信息，其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243" appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3" redirectUri:@"http://www.sharesdk.cn" authType:SSDKAuthTypeBoth];
                 break;
                 
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885" appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                 break;
                 
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"1105520737" appKey:@"4DEo8BPWEN5SAWLg" authType:SSDKAuthTypeBoth];
                 break;
                 
             case SSDKPlatformTypeTencentWeibo:
                 
                 //设置腾讯微博应用信息，其中authType设置为只用Web形式授权
                 [appInfo SSDKSetupTencentWeiboByAppKey:@"801307650" appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c" redirectUri:@"http://www.sharesdk.cn"];
                 break;
             
             default:
                 break;
         }
     }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self configShareSDK];
    
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
