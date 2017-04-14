//
//  ViewController.m
//  08-Values(关键帧动画)
//
//  Created by vera on 16/7/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(60, 60, 60, 60);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = 30;
    [self.view.layer addSublayer:layer];
    
    //关键帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //动画时间
    animation.duration = 5;
    
    //指定关键部分
    /*
     NSValue: 任何类型的包装类
     NSNumber: 基本类型包装类
     */
    animation.values = @[
                         [NSValue valueWithCGPoint:layer.position],
                          [NSValue valueWithCGPoint:CGPointMake(300, 60)],
                         [NSValue valueWithCGPoint:CGPointMake(300, 400)]];
    //原路返回
//    animation.autoreverses = YES;
    
    //停留在终点(默认不停留)
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
    
    //执行动画
    [layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
