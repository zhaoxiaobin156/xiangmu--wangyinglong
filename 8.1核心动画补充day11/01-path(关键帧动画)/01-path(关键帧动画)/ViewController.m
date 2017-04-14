//
//  ViewController.m
//  01-path(关键帧动画)
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
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(20, 30, 50, 50);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    //1.创建path(在OC里面，如果以CG开头的一般都是C的API)
    //空的path
    CGMutablePathRef path = CGPathCreateMutable();
    
#if 0
    //添加一个椭圆
    CGPathAddEllipseInRect(path, NULL, CGRectMake(40, 60, 300, 200));
    
    //矩形
    CGPathAddRect(path, NULL, CGRectMake(40, 60, 300, 200));
    
    //弧
    //(x,y):圆心 radius:半径 startAngle:开始弧度 endAngle:结束弧度 clockwise:是否是顺时针(true表示逆时针，因为和UIKit坐标系不一样)
    CGPathAddArc(path, NULL, 100, 100, 100, 0, M_PI_2, false);
    
    //圆角矩形
    CGPathAddRoundedRect(path, NULL, CGRectMake(40, 60, 300, 200), 30, 30);
#endif
    
    //构造一个抛物线
    CGFloat startX = 50; //起点x
    CGFloat startY = 400;//起点y
    CGFloat endX = 300; //终点x
    CGFloat endY = 400;//终点y
    CGFloat cpx = (startX + endX) / 2;//控点x
    CGFloat cpy = 0;//控点y
    
    //(1).构造起点
    CGPathMoveToPoint(path, NULL, startX, startY);
    
    //(2).构造控制点和终点
    //(cpx,cpy):控制点 (x,y):终点
    CGPathAddQuadCurveToPoint(path, NULL, cpx, cpy, endX, endY);
    
    //2.创建动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //3.动画时间
    animation.duration = 4;
    
    //4.动画轨迹
    animation.path = path;
    
    //5.重复次数
    animation.repeatCount = MAXFLOAT;
    
    //6.速度恒定
    animation.calculationMode = kCAAnimationPaced;
    
    //7.执行动画
    [layer addAnimation:animation forKey:nil];
    
    //8.释放path(当函数类名(CGPathCreateMutable)有create，copy，new，retain，都需要手动释放)
    CGPathRelease(path);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
