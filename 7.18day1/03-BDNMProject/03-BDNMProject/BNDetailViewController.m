//
//  BNDetailViewController.m
//  03-BDNMProject
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNDetailViewController.h"

@interface BNDetailViewController ()
{
    UILabel *_l;
    
    NSInteger _count;
    
    NSTimer *_timer;
}

@end

@implementation BNDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _l = [[UILabel alloc] initWithFrame:CGRectMake(30, 70, 200, 200)];
    _l.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:_l];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    
   
    
//    for (int i = 0; i < 1000000; i++)
//    {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
//        [self.view addSubview:view];
//    }
}

- (void)update
{
    _count++;
    
    _l.text = [NSString stringWithFormat:@"%ld",_count];
    
    NSLog(@"%ld",_count);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [_timer invalidate];
}

- (void)dealloc
{

    
    
    NSLog(@"控制器被销毁........");
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
