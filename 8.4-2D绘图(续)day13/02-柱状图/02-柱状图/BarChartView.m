//
//  BarChartView.m
//  02-柱状图
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BarChartView.h"
#import "ChartView.h"
#import "ChartViewConfig.h"

@interface BarChartView ()
{
    NSArray *_coordinates;
    UIColor *_barColor;
    BOOL _animated;
}

@property (nonatomic, weak) ChartView *chartView;

@end

@implementation BarChartView

/**
 *  初始化
 *
 *  @param coordinates 数据
 *  @param barColor    柱状形的颜色
 *  @param animated    是否需要东西
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithCoordinates:(NSArray *)coordinates barColor:(UIColor *)barColor animated:(BOOL)animated
{
    if (self = [super init])
    {
        _coordinates = coordinates;
        _barColor = barColor;
        _animated = animated;
    
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //contentSize的宽度
    CGFloat contentSizeWidth = 2 * (kInsertSpace + kStartSpace) + kXWidthPointBetweenPoint * (_coordinates.count - 1);
    
    self.contentSize = CGSizeMake(contentSizeWidth, 0);
    
    //修改chartView的frame
    _chartView.frame = CGRectMake(0, 0, contentSizeWidth, self.frame.size.height);
}

/**
 *  开始绘制
 */
- (void)stroke
{
    ChartView *chartView = [[ChartView alloc] initWithCoordinates:_coordinates barColor:_barColor animated:_animated];
    chartView.backgroundColor = [UIColor clearColor];
    [self addSubview:chartView];
    
    _chartView = chartView;
}

@end
