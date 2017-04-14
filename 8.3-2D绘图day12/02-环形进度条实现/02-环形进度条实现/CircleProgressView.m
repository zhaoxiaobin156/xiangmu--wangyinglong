//
//  CircleProgressView.m
//  02-环形进度条实现
//
//  Created by vera on 16/8/3.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "CircleProgressView.h"

//默认线的宽度
#define kDefaultLineWidth 30

@interface CircleProgressView ()

/**
 *  轨迹
 */
@property (nonatomic, weak) CAShapeLayer *backgroundShapeLayer;

/**
 *  进度
 */
@property (nonatomic, weak) CAShapeLayer *progressShapeLayer;

@end

@implementation CircleProgressView

#pragma mark --- lift cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    _lineWidth = kDefaultLineWidth;
    
    //解决进度条被覆盖
    [self backgroundShapeLayer];
}

- (CAShapeLayer *)progressShapeLayer
{
    if (!_progressShapeLayer)
    {
        CAShapeLayer *layer = [CAShapeLayer layer];
        
        //线的宽度
        layer.lineWidth = _lineWidth;
        
        //线的颜色
        layer.strokeColor = [UIColor orangeColor].CGColor;
        
        //填充颜色
        layer.fillColor = [UIColor clearColor].CGColor;
        
        //两端线的样式
        layer.lineCap = kCALineCapRound;
         
        [self.layer addSublayer:layer];
        
        _progressShapeLayer = layer;
    }
    
    return _progressShapeLayer;
}

- (CAShapeLayer *)backgroundShapeLayer
{
    if (!_backgroundShapeLayer)
    {
        CAShapeLayer *layer = [CAShapeLayer layer];
        
        //线的宽度
        layer.lineWidth = _lineWidth;
        
        //线的颜色
        layer.strokeColor = [UIColor blackColor].CGColor;
        
        //填充颜色
        layer.fillColor = [UIColor clearColor].CGColor;
        
//        layer.borderColor = [UIColor yellowColor].CGColor;
//        layer.borderWidth = 10;
        
        [self.layer addSublayer:layer];
        
        _backgroundShapeLayer = layer;
    }
    
    return _backgroundShapeLayer;
}

#pragma mark --- 重写setter方法

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    //修改进度比例
    self.progressShapeLayer.strokeEnd = progress;
}

- (void)setProgressTintColor:(UIColor *)progressTintColor
{
    _progressTintColor = progressTintColor;
    
    //修改线条颜色
    self.progressShapeLayer.strokeColor = progressTintColor.CGColor;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    
    //修改线条的宽度
    self.backgroundShapeLayer.lineWidth = lineWidth;
    self.progressShapeLayer.lineWidth = lineWidth;
    
    /**
     重新设置path
     */
    [self initBezierPath];
}

#pragma mark --- 当前视图已经添加到父视图上(addSubView方法之后走这个方法)

- (void)didMoveToSuperview
{
    NSLog(@"didMoveToSuperview");
    
    [super didMoveToSuperview];
    
    /**
     初始化path
    */
    [self initBezierPath];
    
#if 0
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddEllipseInRect(path, NULL, self.bounds);
    
    self.backgroundShapeLayer.path = path;
    
    CGPathRelease(path);
#endif
}

#pragma mark --- 初始化path

- (void)initBezierPath
{
    /**
     *  1.轨迹的path
     *
     */
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:MIN(self.frame.size.width, self.frame.size.height) / 2 - self.lineWidth / 2 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    //设置路径
    self.backgroundShapeLayer.path = bezierPath.CGPath;
    
    /**
     *  2.进度的path
     *
     */
    UIBezierPath *progessBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:MIN(self.frame.size.width, self.frame.size.height) / 2 - self.lineWidth / 2 startAngle:0 endAngle: M_PI * 2 clockwise:YES];
    
    //设置路径
    self.progressShapeLayer.path = progessBezierPath.CGPath;
    
    self.progressShapeLayer.strokeEnd = _progress;
}

#pragma mark --- layoutSubviews

- (void)layoutSubviews
{
    NSLog(@"layoutSubviews");
    
    [super layoutSubviews];
    
    self.backgroundShapeLayer.frame = self.bounds;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
