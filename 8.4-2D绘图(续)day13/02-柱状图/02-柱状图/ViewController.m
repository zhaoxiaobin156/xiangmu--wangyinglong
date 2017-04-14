//
//  ViewController.m
//  02-柱状图
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "BarChartView.h"
#import "CoordinateItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BarChartView *barView = [[BarChartView alloc] initWithCoordinates:[self coordinates] barColor:[UIColor redColor] animated:YES];
    barView.frame = CGRectMake(0, 20, self.view.frame.size.width, 400);
    barView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:barView];
    
    //开始绘制
    [barView stroke];
}

- (NSArray *)coordinates
{
    NSArray *values = @[@(10),@(30),@(70),@(100),@(50),@(30),@(20),@(50)];
    
    NSMutableArray *items = [NSMutableArray array];
    
    for (int i = 0; i < values.count; i++)
    {
        CoordinateItem *item = [CoordinateItem coordinateItemWithXValue:[NSString stringWithFormat:@"%d",i + 1] yValue:[values[i] floatValue]];
        
        [items addObject:item];
    }
    
    return items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
