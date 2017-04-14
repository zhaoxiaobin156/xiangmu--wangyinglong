//
//  FriendViewController.swift
//  QQProject
//
//  Created by vera on 16/7/25.
//  Copyright © 2016年 deli. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Test2DetailViewController()

        // Do any additional setup after loading the view.
    }
    
    //1.初始化界面
    func initizable()
    {
        //TODO:初始化界面代码
    }
    
    //2.请求数据
    func startRequestData()
    {
        
     
        /*
<<<<<< .mine
     我的代码
======
      别人的代码
>>>>>>> .r版本号
      */
        
        //TODO:请求数据

        let url = NSURL(string: "http://www.baidu.com")
        let _ = NSData(contentsOfURL: url!);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
