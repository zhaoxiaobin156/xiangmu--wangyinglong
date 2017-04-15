//
//  ViewController.m
//  03-测试静态库
//
//  Created by vera on 16/8/6.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "HttpRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     注意：1.如果静态库中有类别就不需要添加-ObjC；静态库外有类别则需要添加-ObjC
          2.工程模式要与导入的静态库模式一致才能运行(是Debug还是Release以及是模拟器还是真机)
          3.不同模式静态库合并 -> 在终端输入：lipo -create Debug-iphoneos/xxx.a Debug-iphonesimulator/xxx.a -output 随便一个路径/xxx.a(注意：只能模拟器与真机合并，不能模拟器与模拟器或者真机与真机合并)
     */
    
    [HttpRequest GET];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
