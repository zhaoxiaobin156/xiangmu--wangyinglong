//
//  ViewController.m
//  回调的其他写法Demo
//
//  Created by vera on 16/7/21.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestView *test = [[TestView alloc] initWithFrame:self.view.bounds];
    [test addTarget:self sel:@selector(enterDetail)];
    [self.view addSubview:test];
}

- (void)enterDetail
{
    NSLog(@"ssss");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
