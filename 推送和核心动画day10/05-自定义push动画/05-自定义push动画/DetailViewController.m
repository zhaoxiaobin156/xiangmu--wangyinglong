//
//  DetailViewController.m
//  05-自定义push动画
//
//  Created by vera on 16/7/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(back)];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
    animation.subtype = kCATransitionFromLeft;
    
    //执行动画
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
