//
//  ViewController.m
//  04-category的衍生的使用场景
//
//  Created by vera on 16/8/12.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Addition.h"
#import "NSString+Formatter.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *s;
    
    [s formatter];
    [s addition];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
