//
//  AppDelegate.swift
//  01-StoryBoard模块化
//
//  Created by vera on 16/7/25.
//  Copyright © 2016年 deli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.backgroundColor = UIColor.whiteColor()
        
        /*
         //代码创建
        let oneCtrl = OneViewController()
        let twoCtrl = TwoViewController()
        
        oneCtrl.title = "One"
        twoCtrl.title = "Two"
        
        let tabbarCtrl = UITabBarController()
        tabbarCtrl.viewControllers = [oneCtrl, twoCtrl]
        window?.rootViewController = tabbarCtrl
 */
        
        //1.创建sb对象
        let sb1 = UIStoryboard(name: "OneStoryboard", bundle: nil)
        let sb2 = UIStoryboard(name: "TwoStoryboard", bundle: nil)
        
        //2.读取InitialViewController
        let oneCtrl = sb1.instantiateInitialViewController()
        let twoCtrl = sb2.instantiateInitialViewController();
        
        oneCtrl!.title = "One"
        twoCtrl!.title = "Two"
        
        //3.添加到tabbarController里面
        let tabbarCtrl = UITabBarController()
        tabbarCtrl.viewControllers = [oneCtrl!, twoCtrl!]
        window?.rootViewController = tabbarCtrl
        
        
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

