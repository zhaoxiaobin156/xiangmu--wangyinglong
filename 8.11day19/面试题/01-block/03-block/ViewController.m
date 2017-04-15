//
//  ViewController.m
//  03-block
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) void(^xxBlock)();

@end

@implementation ViewController

- (void)addBlock:(NSMutableArray *)array
{
    //block的实现原理：block是一个对象，block就是C的函数指针，指向的是一段代码的实现
    
    void(^block)();
    
    //全局block
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
    
    int a = 10;
    
    //栈block
    block = ^()
    {
        NSLog(@"block222触发了，a ＝ %d",a);
    };
    
    //block2是堆block，block还是栈block
    //block2 = [block copy];
    
    NSLog(@"%@",block);
    
    //堆block
    NSLog(@"%@",[block copy]);
    
    //把block添加数组里面
    [array addObject:[[block copy] autorelease]];
}

- (void)addBlock333:(NSMutableArray *)array
{
    void(^block)();
    
    NSString *str = @"sss";
    
    //全局block
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
    
    /*
    一、block的类型：
     1.全局block(NSGlobalBlock)：全局都能用
     2.栈block(NSStackBlock)：超过当前作用域就被回收
     3.堆block(NSMallocBlock)：全局都能用(要管理内存)
     
     二、怎么区分block：
     1.如果block实现里面没有访问任何变量(局部变量和全局变量)，则当前block就是全局block
     2.如果block实现里面有访问任何变量(局部变量和全局变量)，则当前block就是栈block
     3.如果栈block发送copy或者Block_copy(block)消息，则返回的block是堆block
     注意：在mrc环境下，当对栈block发送copy消息，就会把栈block复制到堆上
          在arc环境下，所有的栈block，编译器都是自动把栈block复制到堆上
     
     三、block为什么只能用copy：
     Block的copy、retain、release操作不同于NSObject的copy、retain、release操作：
     1.Block_copy与copy等效，Block_release与release等效
     
     2.对Block不管是retain、copy、release都不会改变引用计数，retainCount始终是1
     
     3.NSGlobalBlock：retain、copy、release操作都无效
     
     4.NSStackBlock：retain、release操作无效。必须注意的是，NSStackBlock在函数返回后，Block内存将被回收，即使retain也没用。容易犯的错误是[[mutableAarry addObject:stackBlock]，在函数出栈后，从mutableAarry中取到的stackBlock已经被回收，变成了野指针。正确的做法是先将stackBlock copy到堆上，然后加入数组：[mutableAarry addObject:[[stackBlock copy] autorelease]]。支持copy，copy之后生成新的NSMallocBlock类型对象
     
     5.NSMallocBlock支持retain、release，虽然retainCount始终是1，但内存管理器中仍然会增加、减少计数。copy之后不会生成新的对象，只是增加了一次引用，类似retain
     
     总结：尽量不要对Block使用retain操作
     
     四、__block和__weak的区别：
     1.在arc环境和mrc环境，用__block修改的变量，可以在block内修改变量值
     2.在mrc环境下，__block解决循环引用；在arc环境下，__weak解决循环引用
     注意：__block在arc环境下不能解决循环引用
     */
    
    __block int a  = 0;
    void(^blockTest)() = ^(){
        a = 6;
    };
    blockTest();
    
    //在MRC环境下：
    //[NSMutableArray array] = [[[NSMutableArray alloc] init] autorelease]
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [self addBlock222:array];
    
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
