//
//  LoginSuccessViewController.m
//  KnowPresentNet
//
//  Created by mac on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LoginSuccessViewController.h"
#import "TabBarController.h"
#import "PrefixHeader.pch"

@interface LoginSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation LoginSuccessViewController

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden  = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
  
    
}


- (void)createView
{
    
    self.imageV.image = [UIImage imageNamed:@"Default"];
    
    self.imageV.userInteractionEnabled = YES;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    
    
    [self.imageV addGestureRecognizer:tap];
    
   
}

- (void)tapClick:(UIGestureRecognizer *)tap
{
 
    TabBarController *tabBarC = [[TabBarController alloc] init];
    
    [self presentViewController:tabBarC animated:YES completion:nil];
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
