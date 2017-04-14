//
//  ViewController.m
//  01-饼状图
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "PieChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PieChartView *pieChartView = [[PieChartView alloc] initWithFrame:CGRectMake(50, 60, self.view.frame.size.width - 100, self.view.frame.size.width - 100)];
    pieChartView.values = @[@(100),@(200),@(300),@(300),@(200),@(100)];
    pieChartView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pieChartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
