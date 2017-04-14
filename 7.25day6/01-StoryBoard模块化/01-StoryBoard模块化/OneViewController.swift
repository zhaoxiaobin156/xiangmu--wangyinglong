//
//  OneViewController.swift
//  01-StoryBoard模块化
//
//  Created by vera on 16/7/25.
//  Copyright © 2016年 deli. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purpleColor()

        // Do any additional setup after loading the view.
        
        //创建CustomView
        let customView = NSBundle.mainBundle().loadNibNamed("CustomView", owner: self, options: nil).first as! CustomView
        //重新设置大小
        customView.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
        view.addSubview(customView)
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
