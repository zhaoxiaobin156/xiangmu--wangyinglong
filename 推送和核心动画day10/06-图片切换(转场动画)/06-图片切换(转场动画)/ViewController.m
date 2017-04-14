//
//  ViewController.m
//  06-图片切换(转场动画)
//
//  Created by vera on 16/7/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

//图片的最大索引
#define kMaxNumber 5

@interface ViewController ()
{
    //图片的索引
    NSInteger _currentIndex;
}

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation ViewController

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[self currentAnimationImage]];
        imageView.frame = self.view.bounds;
        imageView.userInteractionEnabled = YES;
        [self.view addSubview:imageView];
        
        _imageView = imageView;
    }
    
    return _imageView;
}

/**
 *  创建滑动手势
 *
 *  @param direction <#direction description#>
 *
 *  @return <#return value description#>
 */
- (UISwipeGestureRecognizer *)swipeGestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandle:)];
    swipe.direction = direction;
    
    return swipe;
}

/**
 *  添加滑动手势
 */
- (void)addSwipeGesture
{
    [self.imageView addGestureRecognizer:[self swipeGestureRecognizerWithDirection:UISwipeGestureRecognizerDirectionRight]];
    [self.imageView addGestureRecognizer:[self swipeGestureRecognizerWithDirection:UISwipeGestureRecognizerDirectionLeft]];
}

/**
 *  处理滑动手势
 *
 *  @param gesture <#gesture description#>
 */
- (void)swipeHandle:(UISwipeGestureRecognizer *)gesture
{
    CATransition *animation = [CATransition animation];
    
    //动画时间
    animation.duration = 1;
    
    //动画类型
    animation.type = @"rippleEffect";

    //向右滑，上页
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight)
    {
        _currentIndex--;
        
        //如果图片的索引小于0，加载最后一张图片，实现循环图片
        if (_currentIndex < 0)
        {
            _currentIndex = kMaxNumber;
        }
        
        animation.subtype = kCATransitionFromLeft;
        
    }
    
    //向左滑，下页
    else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        _currentIndex++;
        
        if (_currentIndex > kMaxNumber)
        {
            _currentIndex = 0;
        }
        
        animation.subtype = kCATransitionFromRight;
    }
    
    //执行动画
    [self.imageView.layer addAnimation:animation forKey:nil];
    
    //修改图片
    self.imageView.image = [self currentAnimationImage];
}

/**
 *  返回当前的图片
 *
 *  @return <#return value description#>
 */
- (UIImage *)currentAnimationImage
{
    //1.获取名字
    NSString *imageName = [NSString stringWithFormat:@"Irelia_%ld",_currentIndex];
    
    //2.获取图片
    return [UIImage imageNamed:imageName];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addSwipeGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
