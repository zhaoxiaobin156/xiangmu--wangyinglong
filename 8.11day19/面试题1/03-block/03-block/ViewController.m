//
//  ViewController.m
//  03-block
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)addBlock:(NSMutableArray *)array
{
    //block的实现原理：block是一个对象，block就是C的函数指针，指向的是一段代码的实现
    
    void(^block)();
    
    block = ^()
    {
        NSLog(@"block触发了");
    };
    
    NSLog(@"%@",block);
    
    //把block添加数组里面
    [array addObject:block];
}

- (void)addBlock222:(NSMutableArray *)array
{
    void(^block)();
    
    static int a = 10;
    
    block = ^()
    {
        NSLog(@"block222触发了，a ＝ %d",a);
    };
    
    //把block添加数组里面
    [array addObject:block];
}

- (void)addBlock333:(NSMutableArray *)array
{
    void(^block)();
    
    NSString *str = @"sss";
    
    block = ^()
    {
        NSLog(@"block333触发了");
    };
    
    NSLog(@"%@",str);
    
    //把block添加数组里面
    [array addObject:block];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //注意：该Demo目前处于MRC环境下
    
    //在MRC环境下：
    //[NSMutableArray array] = [[[NSMutableArray alloc] init] autorelease]
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [self addBlock:array];
    
    //从数组里面取出对象
    void(^block)() = [array firstObject];
    
    block();
    
    [array release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
