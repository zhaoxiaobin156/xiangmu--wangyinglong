//
//  MainViewController.swift
//  QQProject
//
//  Created by vera on 16/7/25.
//  Copyright © 2016年 deli. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var name: String?
    
    lazy var button: UIButton = {
        
        return UIButton()
    }();

    override func viewDidLoad() {
        super.viewDidLoad()

        //b Do any additional setup after loading the view.
        
        Test1ViewController()
        Test1DetailViewController()
        T1111ViewController()
        
    }
    
    //添加请求代码
    func startHTTPRequest(urlString: String)
    {
        let url = NSURL(string: "sss");
        let _ = NSData(contentsOfURL: url!)
    }
    
    func test1Method()
    {
        print("test1实现界面初始化")
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
