//
//  ViewController.m
//  01-CALayer
//
//  Created by vera on 16/8/3.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#if 0
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(20, 40, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    NSLog(@"%@",NSStringFromCGPoint(layer.anchorPoint));
    
    //获取layer的子图层
//    layer.sublayers;
    
    //获取layer的父图层
//    layer.superlayer;
    
    //从父图层上移除
//    [layer removeFromSuperlayer];
#endif
    
    [self transform];
}

#pragma mark --- 5.图层内容和内容样式

- (void)layerContent
{
    //设置层的内容
    //添加背景效率非常高，而且不占用内存
    self.view.layer.contents = (id)[UIImage imageNamed:@"ShakeforsongBgshade"].CGImage;
    
    //层
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 300, 300);
    layer.position = self.view.center;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    //设置背景图片，当前默认填充整个区域，可以会使图片拉伸
    layer.contents = (id)[UIImage imageNamed:@"c75c10385343fbf2c6e17e6eb27eca8064388faa"].CGImage;
    
    //内容的样式，kCAGravityResizeAspect最佳比例
    layer.contentsGravity = kCAGravityResizeAspect;
}

#pragma mark --- 6.图片添加阴影

- (void)shadow
{
    self.view.backgroundColor = [UIColor blackColor];
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 300, 300);
    layer.position = self.view.center;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    //阴影颜色
    layer.shadowColor = [UIColor greenColor].CGColor;
    
    //阴影半径
    layer.shadowRadius = 50;
    
    //阴影偏移
    layer.shadowOffset = CGSizeMake(10, 10);
    
    //不透明度：1表示不透明，0表示透明(默认透明)
    layer.shadowOpacity = 1;
}

#pragma mark --- 7.图片添加阴影路径(CGMutablePathRef)

- (void)shadowPath
{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.position = self.view.center;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    layer.shadowColor = [UIColor greenColor].CGColor;

    layer.shadowOpacity = 1;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, layer.frame.size.width / 2, layer.frame.size.height / 2, 200, 0, M_PI * 2, true);
    
    //阴影路径
    layer.shadowPath = path;
    
    CGPathRelease(path);
}

#pragma mark --- 8.剪切超过父图层的部分

- (void)clipsToBounds
{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.position = self.view.center;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    //剪切超过layer的部分，UIView里面是clipsToBounds
    layer.masksToBounds = YES;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(10, 10, 300, 300);
    layer2.backgroundColor = [UIColor greenColor].CGColor;
    [layer addSublayer:layer2];
}

#pragma mark --- 9.图片分割

- (void)clipsImage
{
    CGFloat width = 80;
    CGFloat height = width;
    
    for (int i = 0; i < 9; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30 + (width + 2) * (i % 3), 50 + (height + 2) * (i / 3), width, height)];
        
        imageView.layer.contents = (id)[UIImage imageNamed:@"c75c10385343fbf2c6e17e6eb27eca8064388faa"].CGImage;
        
        //获取图片的某一部分
        imageView.layer.contentsRect = CGRectMake(1.0 / 3.0 * (i % 3), 1.0 / 3.0 * (i / 3), 1.0 / 3.0, 1.0 / 3.0);
        
        [self.view addSubview:imageView];
    }
}

#pragma mark --- 10.仿射变换

- (void)transform
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.bounds = CGRectMake(0, 0, 200, 200);
    imageView.center = self.view.center;
    imageView.image = [UIImage imageNamed:@"c75c10385343fbf2c6e17e6eb27eca8064388faa"];
    [self.view addSubview:imageView];
    
    //3D仿射变化：x，y，z都可以用0，1表示
    imageView.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 1);
    
    //2D仿射变化
//    imageView.layer.affineTransform
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
