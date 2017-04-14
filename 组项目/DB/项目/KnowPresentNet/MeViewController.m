//
//  MeViewController.m
//  KnowPresentNet
//
//  Created by mac on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        UIImage *normalImage = [UIImage reSizeImage:[UIImage imageNamed:@"tab_icon_grey_wode"] toSize:CGSizeMake(30, 30)];
        //设置选中时的图标
        UIImage *selectedImage=[UIImage reSizeImage:[UIImage imageNamed:@"tab_icon_red_wode"] toSize:CGSizeMake(30, 30)];
        
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:normalImage selectedImage:selectedImage];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:242/255.0 blue:243/255.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationItem.title = @"我";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
