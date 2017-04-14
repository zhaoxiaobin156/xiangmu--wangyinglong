//
//  ViewController.m
//  03-Core Graphics
//
//  Created by vera on 16/8/3.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     drawRect:绘图图形
     
     什么时候调用：
     1.addSubview之后(viewWillAppear之后，在viewDidAppear之前)
       注意：当前视图必须设置frame，但是不能为CGRectZero(CGRectZero = CGRectMake(0, 0, 0, 0))
     
     2.setNeedsDisplay会触发drawRect:方法
       注意：千万不能手动调用drawRect，如果需要调用drawRect进行刷新，只需要调用setNeedsDisplay，因为setNeedsDisplay会自动触发drawRect
     */
    
    CustomView *customView = [[CustomView alloc] init];
    customView.frame = CGRectMake(0, 0, self.view.frame.size.width, 500);
    customView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:customView];
    
#if 0
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //调用drawRect
        [customView setNeedsDisplay];
        
    });
#endif
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear:111");
    
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear:222");
    
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear:333");
    
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear:444");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
