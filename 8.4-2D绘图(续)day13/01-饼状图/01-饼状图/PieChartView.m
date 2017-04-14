//
//  PieChartView.m
//  01-饼状图
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "PieChartView.h"

@implementation PieChartView

- (void)setValues:(NSArray *)values
{
    _values = values;
    
    //调用drawRect重新绘制
    [self setNeedsDisplay];
}

/**
 *  计算总数据的和
 *
 *  @return <#return value description#>
 */
- (CGFloat)sumValue
{
    //__block可以修改局部变量
    __block CGFloat sum = 0;
    
    //遍历
    [self.values enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         sum += [obj floatValue];
    }];
   
    return sum;
}

- (UIColor *)randomColor
{
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    
    //1.CAShapeLayer + UIBezierPath/CGMutablePathRef
    //2.drawRect + UIBezierPath/CGMutablePathRef
    
    //中心点
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    //所有的数据的和
    CGFloat sum = [self sumValue];
    
    //开始弧度
    CGFloat startAngle = 0;
    
    //结束弧度
    CGFloat endAngle = 0;
    
    //有多个数据，就需要绘制多少个扇形
    for (int i = 0; i < _values.count; i++)
    {
        //结束
        endAngle += [_values[i] floatValue] / sum * M_PI * 2;
        
        //圆弧
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:MIN(self.frame.size.width / 2, self.frame.size.height / 2) startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        //圆弧的终点到圆形绘制一条线
        [bezierPath addLineToPoint:center];
        
        //修改起点弧度
        startAngle = endAngle;
        
        //设置线条颜色
//        [[UIColor redColor] setStroke];
        
        //开始绘制
//        [bezierPath stroke];
        
        //设置填充颜色
        [[self randomColor] setFill];
        
        //填充
        [bezierPath fill];
    }
}

@end
