//
//  AppDelegate.swift
//  QQProject
//
//  Created by vera on 16/7/25.
//  Copyright © 2016年 deli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func xxx()
    {
        print("sss")
    }

    func test()
    {
        print("test")
    }

    //test1添加
    func test1()
    {
        print("sss")
    }
    
    
    func applicationMehtodTest1() -> UIApplication
    {
        return UIApplication.sharedApplication()
    }
    
    
    
    //test2添加
    func test2()
    {
        print("sss")
    }
    


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //加载本地的storyboard
       let sb1 =  UIStoryboard(name: "Storyboard", bundle: nil)
       let sb2 = UIStoryboard(name: "FriendStordboard", bundle: nil)
        
        //获取对于的storyboard的InitialViewController
        let mainCtrl = sb1.instantiateInitialViewController()
        let friendCtrl = sb2.instantiateInitialViewController()
        
        //创建tabbarController，并且设置根控制器
        let tabbarCtrl = UITabBarController()
        tabbarCtrl.viewControllers = [mainCtrl!, friendCtrl!]
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

