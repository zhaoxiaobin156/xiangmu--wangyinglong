//
//  BNTabbarViewController.m
//  03-BDNMProject
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNTabbarViewController.h"

@interface BNTabbarViewController ()

@end

@implementation BNTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     *  初始化子控制器
     */
    [self initChildrenViewController];
}

/**
 *  初始化子控制器
 */
- (void)initChildrenViewController
{
    //控制器名字
    NSArray *viewControllers = @[@"BNMainViewController",
                                 @"BNNearViewController",
                                 @"BNChooseViewController",
                                 @"BNMyViewController"];
    
    NSArray *titles = @[@"首页",
                        @"附近",
                        @"精选",
                        @"我的"];
    
    NSArray *normalImages = @[@"icon_tab_shouye_normal",
                              @"icon_tab_fujin_normal",
                              @"tab_icon_selection_normal",
                              @"icon_tab_wode_normal"];
    
    NSArray *selectImages = @[@"icon_tab_shouye_highlight",
                              @"icon_tab_fujin_highlight",
                              @"tab_icon_selection_highlight",
                              @"icon_tab_wode_highlight"];
    
    //数组遍历
    [viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //初始化对象
        UIViewController *viewController = [[NSClassFromString(obj) alloc] init];
        //设置title
        viewController.title = titles[idx];
        //设置图片
        viewController.tabBarItem.image = [UIImage imageNamed:normalImages[idx]];
        viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectImages[idx]];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        nav.navigationBar.translucent = NO;
        
        [self addChildViewController:nav];
    }];
    
    
#if  0
    反射机制
    
    NSStringFromClass(<#Class  _Nonnull __unsafe_unretained aClass#>);
    NSClassFromString(<#NSString * _Nonnull aClassName#>);
    NSStringFromSelector(<#SEL  _Nonnull aSelector#>)
    NSSelectorFromString(<#NSString * _Nonnull aSelectorName#>)
#endif
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
