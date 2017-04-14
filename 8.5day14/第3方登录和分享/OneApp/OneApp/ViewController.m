//
//  ViewController.m
//  OneApp
//
//  Created by vera on 16/8/5.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 *  打开TwoApp
 *
 *  @param sender <#sender description#>
 */
- (IBAction)openTwoApp:(id)sender
{
    //如果实现两个app之间的跳转，两个应用之间需要设置不同的scheme(进入TARGETS -> Info -> URL Types -> URL Schemes里设置)
    
    //schemeName组成：scheme://
    NSString *schemeName = @"com.qianfeng.TwoApp://";
    
    //打开twoApp
    //openURL:打开其他app
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:schemeName]];
    
#if 0
    //1.打开Safari
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
    //2.打开系统设置
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    
    //3.打电话：tel://电话号
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"]];
    
    //4.发短信：sms://电话号
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://10086"]];
#endif
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
