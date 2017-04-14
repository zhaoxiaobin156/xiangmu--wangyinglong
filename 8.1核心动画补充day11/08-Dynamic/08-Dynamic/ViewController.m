//
//  ViewController.m
//  08-Dynamic
//
//  Created by vera on 16/8/1.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (nonatomic, weak) UIView *redView;

/**
 *  所有行为的执行者
 */
@property (nonatomic, strong) UIDynamicAnimator *animator;

/**
 *  重力行为
 */
@property (nonatomic, strong) UIGravityBehavior *gravity;

/**
 *  碰撞行为
 */
@property (nonatomic, strong) UICollisionBehavior *collision;

@end

@implementation ViewController

//仿真元素
//- (UIView *)redView
//{
//    if (!_redView)
//    {
//        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(200, 0, 50, 50)];
//        v.backgroundColor = [UIColor redColor];
//        [self.view addSubview:v];
//        
//        //旋转30度
//        //v.transform = CGAffineTransformMakeRotation(M_PI/180 * 44);
//        
//        _redView = v;
//    }
//    
//    return _redView;
//}

//重力行为
- (UIGravityBehavior *)gravity
{
    if (!_gravity)
    {
        _gravity = [[UIGravityBehavior alloc] init];
    }
    
    return _gravity;
}

//碰撞行为
- (UICollisionBehavior *)collision
{
    if (!_collision)
    {
        _collision = [[UICollisionBehavior alloc] init];
        
        //不会超过当前view的边界
        _collision.translatesReferenceBoundsIntoBoundary = YES;
    }
    
    return _collision;
}

//所有行为的执行者
- (UIDynamicAnimator *)animator
{
    if (!_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    
    return _animator;
}

/**
 *  随机颜色
 *
 *  @return <#return value description#>
 */
- (UIColor *)randomColor
{
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
}

- (void)animations
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(arc4random_uniform(self.view.frame.size.width - 50), 0, 50, 50)];
    view.backgroundColor = [self randomColor];
    [self.view addSubview:view];
    
    //添加重力行为
    [self.gravity addItem:view];
    
    //添加碰撞行为
    [self.collision addItem:view];
    
    //执行重力行为
    [self.animator addBehavior:self.gravity];
    
    //执行碰撞行为
    [self.animator addBehavior:self.collision];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animations) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
