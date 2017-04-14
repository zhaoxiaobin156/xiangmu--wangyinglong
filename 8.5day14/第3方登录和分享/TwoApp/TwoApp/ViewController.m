//
//  ViewController.m
//  TwoApp
//
//  Created by vera on 16/8/5.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)backOneApp:(id)sender
{
    NSString *username = @"xiaoming";
    NSString *password = @"123456";
    
    NSString *schemeName = @"com.qianfeng.OneApp://";
    NSString *schemeUrl = [NSString stringWithFormat:@"%@?username=%@&password=%@",schemeName,username,password];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:schemeUrl]];
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
