//
//  ViewController.m
//  03-系统的应用icon删除动画
//
//  Created by vera on 16/8/1.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

//写一个宏，返回两个数的最小值(如果宏里面有变量，则一定要用括号把变量括起来)
#define kMin(x, y) ((x) > (y) ? (y) : (x))

//角度转化为弧度
#define kToDian(angle) ((angle) * M_PI / 180)

@interface ViewController ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation ViewController

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AppIcon60x60"]];
        imageView.bounds = CGRectMake(0, 0, 100, 100);
        imageView.center = self.view.center;
        imageView.layer.cornerRadius = 15;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
        [self.view addSubview:imageView];
        
        _imageView = imageView;
    }
    
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandle:)];
    [self.imageView addGestureRecognizer:gesture];
}

/**
 *  长按事件
 *
 *  @param longPress <#longPress description#>
 */
- (void)longPressHandle:(UILongPressGestureRecognizer *)longPress
{
    /*
    self.imageView.transform
    反射变换：
    1.rotation弧度
    2.scale比例
    3.translation位移
     */
    
    //长按开始
    if (longPress.state == UIGestureRecognizerStateBegan)
    {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
        
        animation.duration = 0.15;
       
        animation.values = @[@(kToDian(5)),
                             @(kToDian(0)),
                             @(kToDian(-5)),
                             @(kToDian(0)),
                             ];
        
        animation.repeatCount = MAXFLOAT;
        
        [self.imageView.layer addAnimation:animation forKey:@"animation"];
        
#if 0
        //停止所有动画
        [self.imageView.layer removeAllAnimations];
        
        //停止指定的动画
        [self.imageView.layer removeAnimationForKey:@"key"];
#endif
        
        //3秒后停止动画
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            //停止指定的动画
            [self.imageView.layer removeAnimationForKey:@"animation"];
            
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
