//
//  CustomView.m
//  03-Core Graphics
//
//  Created by vera on 16/8/3.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


/**
 *  绘制图形的方法
 *
 *  @param rect <#rect description#>
 */
- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect");
    
    /*
     //pdf上下文
     UIGraphicsBeginPDFPage();
     
     //图片上下文
     UIGraphicsBeginImageContext(<#CGSize size#>);
     */
    
    //1.上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2.设置画笔颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    //3.设置线条的宽度
    CGContextSetLineWidth(context, 10);
    
    [self drawPentagram:context];
}

#pragma mark --- 1.绘制线段

- (void)drawLine:(CGContextRef)context
{
    //1.起点
    CGContextMoveToPoint(context, 50, 50);
    
    //2.终点
    CGContextAddLineToPoint(context, 300, 300);
    
    //3.开始绘制
    CGContextStrokePath(context);
}

#pragma mark --- 2.绘制三角形

- (void)drawTriangle:(CGContextRef)context
{
    //1.起点
    CGContextMoveToPoint(context, 50, 50);
    
    //2.添加一条线段到某点
    CGContextAddLineToPoint(context, 300, 300);
    
    //又添加一条线段
    CGContextAddLineToPoint(context, 300, 50);
    
//    CGContextAddLineToPoint(context, 50, 50);
    
    //封闭区域
    CGContextClosePath(context);
    
    //开始绘制
    CGContextStrokePath(context);
}

#pragma mark --- 3.绘制五角星

- (void)drawPentagram:(CGContextRef)context
{
    [[UIColor greenColor] set];
    
    //确定中心点
    CGPoint centerPoint = CGPointMake(160, 230);
    
    //确定半径
    CGFloat radius = 100.0;
    
    //五角星的顶点
    CGPoint p1 = CGPointMake(centerPoint.x, centerPoint.y - radius);
    CGContextMoveToPoint(context, p1.x, p1.y);
    
    //五角星每个点之间点夹角，采用弧度计算，每两个点进行连线就可以画出五角星
    //点与点之间点夹角为2 * M_PI / 5.0
    CGFloat angle = 4 * M_PI / 5.0;
    
    for (int i = 1; i <= 5; i++) {
        
        CGFloat x = centerPoint.x - sinf(i * angle) * radius;
        CGFloat y = centerPoint.y - cosf(i * angle) * radius;
        
        if (i == 5)
        {
            CGContextClosePath(context);
        }
        else
        {
            CGContextAddLineToPoint(context, x, y);
        }
    }
    
    //填充路径
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark --- 4.绘制多条线段

- (void)drawManyLines:(CGContextRef)context
{
    //1.点的集合
    CGPoint points[3] = {
        CGPointMake(50, 50),
        CGPointMake(300, 300),
        CGPointMake(300, 50)
    };
    
    //2.添加多个线
    CGContextAddLines(context, points, sizeof(points) / sizeof(points[0]));
    
    //3.封闭区域
    CGContextClosePath(context);
    
    //4.开始绘制
    CGContextStrokePath(context);
}

#pragma mark --- 5.绘制虚线

- (void)drawDashLine:(CGContextRef)context
{
    //保存上下文
    CGContextSaveGState(context);
    
    //修改线条的宽度
    CGContextSetLineWidth(context, 5);
    
    //修改为虚线
    
//    CGFloat lengths[3] = {10,20,30};
    CGFloat lengths[1] = {5};
    
    /*
     参数1：上下文
     参数2：开始跳过多少个点
     参数3：线的样式
     参数4：lengths长度
     */
    CGContextSetLineDash(context, 0, lengths, sizeof(lengths) / sizeof(lengths[0]));
    
    /*
     虚线部分
     */
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 300, 50);
    CGContextStrokePath(context);
    
    /*
     实线部分
     */
    //重新修改颜色
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    
    //重新设置线的样式
    CGContextSetLineDash(context, 0, NULL, 0);
    
    CGContextMoveToPoint(context, 300, 50);
    CGContextAddLineToPoint(context, 300, 400);
    CGContextStrokePath(context);
    
    //恢复上下文
    CGContextRestoreGState(context);
    
    CGContextMoveToPoint(context, 300, 400);
    CGContextAddLineToPoint(context, 50, 50);
    CGContextStrokePath(context);
}

#pragma mark --- 6.绘制长方形或者正方形

- (void)drawRectangle:(CGContextRef)context
{
    //添加一个矩形
    CGContextAddRect(context, CGRectMake(20, 40, 300, 300));
    
    //开始画
    CGContextStrokePath(context);
}

#pragma mark --- 7.绘制填充长方形或者正方形

- (void)drawFillRectangle:(CGContextRef)context
{
    //设置填充颜色
    [[UIColor redColor] setFill];
    
    //绘制填充长方形或者正方形
    CGContextFillRect(context, CGRectMake(20, 40, 300, 300));
    
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    
    //添加一个边框
    CGContextAddRect(context, CGRectMake(15, 35, 310, 310));
    
    //开始画
    CGContextStrokePath(context);
}

#pragma mark --- 8.绘制椭圆或者圆

- (void)drawEllipse:(CGContextRef)context
{
    /**
     *  添加一个边框(边框的中心才是长方形或者正方形的CGPoint)
     */
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextAddRect(context, CGRectMake(20, 40, 300, 300));
    CGContextStrokePath(context);
    
    /**
     *  添加一个椭圆或者圆
     */
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextAddEllipseInRect(context, CGRectMake(20, 40, 300, 300));
    CGContextStrokePath(context);
}

#pragma mark --- 9.绘制填充椭圆或者圆

- (void)drawFillEllipse:(CGContextRef)context
{
    //填充颜色
    [[UIColor redColor] setFill];
    
    CGContextFillEllipseInRect(context, CGRectMake(20, 40, 300, 300));
}

#pragma mark --- 10.绘制弧度

- (void)drawArc:(CGContextRef)context
{
    //最后一个0相当于false
    CGContextAddArc(context, 200, 200, 100, 0, M_PI_2, 0);
   
    CGContextStrokePath(context);
}

#pragma mark --- 11.绘制贝塞尔曲线

- (void)drawQuadCurve:(CGContextRef)context
{
    //起点
    CGContextMoveToPoint(context, 20, 400);
    
    //画抛物线
    CGContextAddQuadCurveToPoint(context, 150, 0, 300, 400);
    
    CGContextStrokePath(context);
}

#pragma mark --- 12.绘制文字

- (void)drawText
{
    //绘制到指定点
    [@"dss" drawAtPoint:CGPointMake(300, 300) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:40],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //绘制到指定范围
    [@"sss" drawInRect:CGRectMake(30, 50, 100, 100) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:40],NSForegroundColorAttributeName:[UIColor redColor]}];
}

#pragma mark --- 13.绘制图片

- (void)drawImage
{
    /*
     UIImage *image;
     
     //获取图片的原始大小
     image.size;
     */
    
    //默认获取图片的大小
//    [[UIImage imageNamed:@"c75c10385343fbf2c6e17e6eb27eca8064388faa"] drawAtPoint:CGPointMake(20, 30)];
    
    [[UIImage imageNamed:@"c75c10385343fbf2c6e17e6eb27eca8064388faa"] drawInRect:CGRectMake(20, 30, 200, 300)];
}

@end
