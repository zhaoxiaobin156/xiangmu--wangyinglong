//
//  ViewController.m
//  RunloopDemo
//
//  Created by vera on 16/7/21.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self performSelectorInBackground:@selector(newThread) withObject:nil];
    //修改定时的mode
    /*
     NSRunLoop:事件循环机制
     主线程的NSRunLoop默认自动启动的，分线程NSRunLoop需要我们手动启动
     */
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
}

- (void)newThread
{
    
    NSLog(@"----------");
    
    //scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:如果在主线程中创建，系统自动添加到runloop。如果在分线程runloop没有启动，NSTimer的方法就不会执行。
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChangeHandle) userInfo:nil repeats:YES];
    
    //启动分线程的runloop
    [[NSRunLoop currentRunLoop] run];
}

- (void)timeChangeHandle
{
    NSLog(@"sfdsds");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
