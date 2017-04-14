//
//  ViewController.m
//  04-购物车动画
//
//  Created by vera on 16/8/1.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingCarCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource,CAAnimationDelegate>

@property (nonatomic, weak) UITableView *tableView;

/**
 *  购物车按钮
 */
@property (nonatomic, weak) UIButton *shoppingCarButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self tableView];
    
    /**
     *  创建购物车
     */
    [self createShoppingCar];
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        UITableView *tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        tb.delegate = self;
        tb.dataSource = self;
        tb.rowHeight = 80;
        [self.view addSubview:tb];
        
        [tb registerNib:[UINib nibWithNibName:@"ShoppingCarCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
        
        _tableView = tb;
    }
    
    return _tableView;
}

- (void)createShoppingCar
{
    CGFloat space = 20;
    
    CGFloat width = 60;
    CGFloat height = width;
    
    CGFloat x = space;
    CGFloat y = self.view.frame.size.height - height - space;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(x, y, width, height);
    [btn setBackgroundImage:[UIImage imageNamed:@"shoppingCar"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    self.shoppingCarButton = btn;
}

#pragma mark --- 开始动画

/**
 *  开始动画
 *
 *  @param startPoint <#startPoint description#>
 */
- (void)startAnimation:(CGPoint)startPoint
{
    //起点
    startPoint = [self.tableView convertPoint:startPoint toView:self.view];
    
    //终点坐标
    CGPoint endPoint = self.shoppingCarButton.center;
    
    //控点
    CGFloat cx = endPoint.x;
    CGFloat cy = startPoint.y;
    
    /*
     一、构造贝塞尔曲线
     */
    CGMutablePathRef path = CGPathCreateMutable();
    
    //添加抛物线
    //1.起点
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    
    //2.控制点和终点
    CGPathAddQuadCurveToPoint(path, NULL, cx, cy, endPoint.x, endPoint.y);
    
    /*
     二、创建要进行动画视图
     */
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images"]];
    imageView.bounds = CGRectMake(0, 0, 40, 40);
    imageView.layer.cornerRadius = 20;
    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];
    
    /*
     三、执行动画
     */
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    animation.path = path;

    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    animation.delegate = self;
    
    [imageView.layer addAnimation:animation forKey:nil];
    
    CGPathRelease(path);
}

#pragma mark --- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    //设置加入购物车回调
    [cell setShoppingCarCellDidClickShoppingCarButtonCallback:^(CGPoint startPoint)
    {
        //开始动画
        [self startAnimation: startPoint];
        
    }];
    
    return cell;
}

/**
 *  动画完成会自动触发
 *
 *  @param anim <#anim description#>
 *  @param flag <#flag description#>
 */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag)
    {
        NSLog(@"动画完成");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
