//
//  ViewController.m
//  05-自定义push动画
//
//  Created by vera on 16/7/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
        
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(nextController)];
}

- (void)nextController
{
    DetailViewController *detailCtrl = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailCtrl animated:YES];
    
    //所有的核心动画都是在后台线程执行的，不会堵塞主线程
    
    /**
     *  转场动画
     */
    CATransition *animation = [CATransition animation];
    
    //动画时间，单位是秒
    animation.duration = 1;
    
    //动画类型
    animation.type = @"cube";
    
    //动画方向
    animation.subtype = kCATransitionFromRight;
    
    //执行动画
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
