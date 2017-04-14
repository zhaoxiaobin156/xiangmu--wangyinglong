//
//  ViewController.m
//  07-CAAnimationGroupDemo
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
    animation.toValue = (id)[UIColor greenColor].CGColor;
    
    //修改圆角
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation2.toValue = @(50);
    
    //存放其他动画对象，而且组里面的动画会同时执行
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2;
    group.autoreverses = YES;
    group.repeatCount = MAXFLOAT;
    group.animations = @[animation,animation2];
    
    //执行动画组，动画组会执行组里面的每个动画对象
    [view.layer addAnimation:group forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
