//
//  TabBarController.m
//  KnowPresentNet
//
//  Created by mac on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TabBarController.h"
#import "ManagerViewController.h"
#import "TacticViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStoryboard *oneSB = [UIStoryboard storyboardWithName:@"One" bundle:nil];
    UIStoryboard *twoSB = [UIStoryboard storyboardWithName:@"Two" bundle:nil];
    
    ManagerViewController *managerVC = [oneSB instantiateInitialViewController];
    TacticViewController *tacticVC = [twoSB instantiateInitialViewController];
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
    MeViewController *meVC = [[MeViewController alloc] init];
    
    UINavigationController *managerNav = [[UINavigationController alloc] initWithRootViewController:managerVC];
    UINavigationController *tacticNav = [[UINavigationController alloc] initWithRootViewController:tacticVC];
    UINavigationController *discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:meVC];
    

    
    self.viewControllers = @[managerNav,tacticNav,discoverNav,meNav];
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
