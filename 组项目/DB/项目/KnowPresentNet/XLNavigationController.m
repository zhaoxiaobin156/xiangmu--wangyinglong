//
//  XLNavigationController.m
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "XLNavigationController.h"

@interface XLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self createUI];
}

- (void)createUI
{
    // 设置背景图片
    UIImage *navCYHImage = [UIImage imageNamed:@"banner"];
    navCYHImage = [navCYHImage stretchableImageWithLeftCapWidth:160 topCapHeight:22];
    [self.navigationBar setBackgroundImage:navCYHImage forBarMetrics:UIBarMetricsDefault];
    
    // 标题的样式
    UIColor *titleColor = [UIColor whiteColor];
    UIFont *titleFont = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName: titleFont, NSForegroundColorAttributeName: titleColor}];
    
    
    self.interactivePopGestureRecognizer.delegate = self;
    
}

#pragma mark - UIGestureRecognizerDelegate

// 手势将要开始的时候，是否允许启用这个手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 判断是否是返回的手势
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        // 判断是否有PUSH出ViewController
        if (self.viewControllers.count > 1) {
            return YES;
        }
        
        return NO;
    }
    
    return YES;
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
