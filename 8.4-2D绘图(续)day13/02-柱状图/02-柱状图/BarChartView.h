//
//  BarChartView.h
//  02-柱状图
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarChartView : UIScrollView

/**
 *  初始化
 *
 *  @param coordinates 数据
 *  @param barColor    柱状形的颜色
 *  @param animated    是否需要东西
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithCoordinates:(NSArray *)coordinates barColor:(UIColor *)barColor animated:(BOOL)animated;

/**
 *  开始绘制
 */
- (void)stroke;

@end
