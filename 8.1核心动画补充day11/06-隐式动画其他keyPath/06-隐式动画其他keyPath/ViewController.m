//
//  ViewController.m
//  06-隐式动画其他keyPath
//
//  Created by vera on 16/8/1.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.view.bounds;
    
    //填充颜色
    layer.fillColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
    //path1
    CGMutablePathRef startPath = CGPathCreateMutable();
    CGPathAddRect(startPath, NULL, CGRectMake(100, 100, 50, 0));
    layer.path = startPath;
    
    //path2
    CGMutablePathRef endPath = CGPathCreateMutable();
    CGPathAddRect(endPath, NULL, CGRectMake(100, 100, 50, 300));
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 5;
    
    //开始path
    animation.fromValue = (__bridge id)(startPath);

    //结束的path
    animation.toValue = (__bridge id _Nullable)(endPath);
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [layer addAnimation:animation forKey:nil];
    
    //释放path
    CGPathRelease(startPath);
    CGPathRelease(endPath);
    
    [self animation];
}

- (void)animation
{
    //红色 -> 绿色
    UIView *view = [[UIView alloc] init];
    view.bounds = CGRectMake(0, 0, 100, 100);
    view.center = self.view.center;
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    //修改的背景颜色
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.duration = 2;
    animation.toValue = (id)[UIColor greenColor].CGColor;
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    [view.layer addAnimation:animation forKey:nil];
    
    //修改圆角
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation2.duration = 2;
    animation2.toValue = @(50);
    animation2.autoreverses = YES;
    animation2.repeatCount = MAXFLOAT;
    [view.layer addAnimation:animation2 forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
