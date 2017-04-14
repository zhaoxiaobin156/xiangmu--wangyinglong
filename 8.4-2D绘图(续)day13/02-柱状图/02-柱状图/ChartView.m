//
//  ChartView.m
//  02-柱状图
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ChartView.h"
#import "ChartViewConfig.h"
#import "CoordinateItem.h"

@interface NSString (Size)

/**
 *  计算指定文字高度
 *
 *  @param width    <#width description#>
 *  @param fontSize <#fontSize description#>
 *
 *  @return <#return value description#>
 */
- (CGFloat)heightWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize;

@end

@implementation NSString (Size)

/**
 *  计算指定文字高度
 *
 *  @param width    <#width description#>
 *  @param fontSize <#fontSize description#>
 *
 *  @return <#return value description#>
 */
- (CGFloat)heightWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:nil].size.height;
}

@end

@interface ChartView ()
{
    NSArray *_coordinates;
    UIColor *_barColor;
    BOOL _animated;
}

@end

@implementation ChartView

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
    }
    
    return self;
}

#pragma mark - y轴每行高度

/**
 *  每行高度
 *
 *  @return <#return value description#>
 */
- (CGFloat)rowHeigth
{
    return (self.frame.size.height - 2 * kInsertSpace) / kRowNumber;
}

#pragma mark --- 获取所有数据的最大值

- (CGFloat)maxValueInDataSource
{
    __block CGFloat max = 0;
    
    //遍历查找
    [_coordinates enumerateObjectsUsingBlock:^(CoordinateItem *item, NSUInteger idx, BOOL * _Nonnull stop)
    {
        //如果当前值比原来保存的最大值还大
        if (item.yValue > max)
        {
            //替换最大值
            max = item.yValue;
        }
    }];
    
    return max;
}

#pragma mark --- 1.绘制坐标轴

- (void)drawXYCoorndinate:(CGContextRef)context
{
    //坐标轴
    CGContextAddRect(context, CGRectMake(kInsertSpace, kInsertSpace, self.frame.size.width - 2 * kInsertSpace, self.frame.size.height - 2 * kInsertSpace));
    
    //开始绘制
    CGContextStrokePath(context);
    
    //y轴每行高度
    CGFloat rowHeight = [self rowHeigth];
    
    //绘制中间部分的虚线
    CGFloat lenghts[1] = {5};
    CGContextSetLineDash(context, 0, lenghts, sizeof(lenghts) / sizeof(lenghts[0]));
    
    for (int i = 1; i < kRowNumber; i++)
    {
        CGFloat y = kInsertSpace + i * rowHeight;
        
        //添加虚线
        CGContextMoveToPoint(context, kInsertSpace, y);
        CGContextAddLineToPoint(context, self.frame.size.width - kInsertSpace, y);
        CGContextStrokePath(context);
    }
}

#pragma mark --- 2.绘制x轴文字

- (void)drawXCoorndinateText:(CGContextRef)context
{
    for (int i = 0; i < _coordinates.count; i++)
    {
        //获取x轴文字
        CoordinateItem *item = _coordinates[i];
        
        NSString *xValue = item.xValue;
        
        //绘制文字
        [xValue drawAtPoint:CGPointMake(kInsertSpace + kStartSpace + i * kXWidthPointBetweenPoint, self.frame.size.height - kInsertSpace) withAttributes:nil];
    }
}

#pragma mark --- 3.绘制y轴文字

- (void)drawYCoorndinateText:(CGContextRef)context
{
    //所有的数据里面的最大值
    CGFloat max = [self maxValueInDataSource];
    
    //每一行代表的数据
    CGFloat rowAvgData = max / kRowNumber;
    
    //每行高度
    CGFloat rowHeight = [self rowHeigth];
    
    //段落样式
    NSMutableParagraphStyle *paragrphStyle = [[NSMutableParagraphStyle alloc] init];
    
    //设置文字对齐方式
    paragrphStyle.alignment = NSTextAlignmentRight;
    
    //绘制y轴文字
    for (int i = 1; i <= kRowNumber; i++)
    {
        //y轴文字
        NSString *yValue = [NSString stringWithFormat:@"%0.1f",i * rowAvgData];
        
        //文字大小
        CGFloat fontSize = 12;
        
        CGFloat x = 0;
        CGFloat y = self.frame.size.height - kInsertSpace - rowHeight * i;
        
        //文字宽度
        CGFloat textWidth = kInsertSpace - 5;
        
        //文字高度
        CGFloat textHeight = [yValue heightWithWidth:textWidth fontSize:fontSize];
        
        //开始绘制文字
        [yValue drawInRect:CGRectMake(x, y - textHeight / 2, textWidth, textHeight)withAttributes:@{NSParagraphStyleAttributeName:paragrphStyle,NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    }
}

#pragma mark --- 4.绘制柱状

- (void)drawBarRect:(CGContextRef)context
{
    //柱状的x坐标
    CGFloat x = 0;
    
    //柱状的y坐标
    CGFloat y = 0;
    
    //柱状的宽度
    CGFloat w = kBarWidth;
    
    //柱状的高度
    CGFloat h = 0;
    
    //获取所有数据里面的最大值
    CGFloat max = [self maxValueInDataSource];
    
    //绘制柱状
    for (int i = 0; i < _coordinates.count; i++)
    {
        //数据
        CoordinateItem *item = _coordinates[i];
        
        CGFloat yValue = item.yValue;
        
        x = kInsertSpace + kStartSpace + kXWidthPointBetweenPoint * i -  kBarWidth / 2;
        
        //(1 - yValue / max) -> 空白比例
        //(1 - yValue / max) * (self.frame.size.height - 2 * kInsertSpace) -> 空白高度
        y = (1 - yValue / max) * (self.frame.size.height - 2 * kInsertSpace) + kInsertSpace;
        
        h = (yValue / max) * (self.frame.size.height - 2 * kInsertSpace);
        
        //创建柱状形
        CGMutablePathRef toPath = CGPathCreateMutable();
        CGPathAddRect(toPath, NULL, CGRectMake(x, y, w, h));
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        //layer.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        layer.path = toPath;
        layer.fillColor = _barColor.CGColor;
        [self.layer addSublayer:layer];
        
        //需要动画
        if (_animated)
        {
            //1.开始动画的path
            CGMutablePathRef fromPath = CGPathCreateMutable();
            CGPathAddRect(fromPath, NULL, CGRectMake(x, self.frame.size.height - kInsertSpace, w, 0));
            
            //2.创建动画
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
            animation.duration = kAnimatedDuration;
            animation.fromValue = (__bridge id _Nullable)(fromPath);
            animation.toValue = (__bridge id _Nullable)(toPath);
            [layer addAnimation:animation forKey:nil];
            
            //3.释放路径
            CGPathRelease(fromPath);
        }
        
        CGPathRelease(toPath);
    }
}

#pragma mark --- drawRect

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //颜色
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    
    //线条宽度
    CGContextSetLineWidth(context, kLineWidth);
    
    /**
     *  1.绘制坐标轴
     */
    [self drawXYCoorndinate:context];
    
    /**
     *  2.绘制x轴文字
     */
    [self drawXCoorndinateText:context];
    
    /**
     *  3.绘制y轴文字
     */
    [self drawYCoorndinateText:context];
    
    /**
     *  4.绘制柱状
     */
    [self drawBarRect:context];
}

@end
