//
//  AppDelegate.swift
//  Swift_NSClassFromStringDemo
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
        
       
        print( OneViewController())
        
        
        //控制器名字
        let viewControllerNames = ["OneViewController","TwoViewController"]
        //控制器标题
        let titles = ["One","Two"]
        
        let tabbarCtrl = UITabBarController()
        
        /*
         AnyObject 等于 OC的id
         AnyClass = AnyObject.Type
         */
        
        
        //获取工程的名字
        let projectName = projectNameFromInfoPlist()
        
        //动态创建对象
        for i in 0..<viewControllerNames.count
        {
            //1.控制器类
            let cls = NSClassFromString(projectName + "." + viewControllerNames[i]) as! UIViewController.Type
            //2.对象
            let object = cls.init()
            
            //设置标题
            object.title = titles[i]
            
            //3.添加子控制器
            tabbarCtrl.addChildViewController(object)
            
        }
        
        
        window?.rootViewController = tabbarCtrl
        
        return true
    }
    
    /**
     获取工程的名字
     
     - returns: <#return value description#>
     */
    func projectNameFromInfoPlist() -> String
    {
        //获取plist
        let info = NSBundle.mainBundle().infoDictionary
        //获取工程名字
        let projectName = info!["CFBundleName"] as! String
        
        return projectName
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

