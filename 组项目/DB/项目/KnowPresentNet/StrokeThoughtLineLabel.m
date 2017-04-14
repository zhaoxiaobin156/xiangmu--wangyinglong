//
//  StrokeThoughtLineLabel.m
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "StrokeThoughtLineLabel.h"

/**
 *  文字默认颜色
 */
#define kTextDefalutColor [UIColor blackColor]

@interface NSString (Empty)

- (BOOL)isEmpty;

@end

@implementation NSString (Empty)

/**
 *  判断字符串为空
 *
 *  @return <#return value description#>
 */
- (BOOL)isEmpty
{
    return !self || self.length == 0;
}

@end

@interface StrokeThoughtLineLabel ()
{
    NSString *_text;
    
    /**
     *  文字属性
     */
    NSMutableDictionary *_attributes;
}

@end

@implementation StrokeThoughtLineLabel


#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    _attributes = [NSMutableDictionary dictionary];
    
    _strokeThoughtLineColor = kTextDefalutColor;
    
    _strokeThoughtLineStyle = StrokeThoughtLineStyleSingle;
}

#pragma mark - setter
- (void)setText:(NSString *)text
{
    _text = text;

    //添加属性:中划线
    [_attributes setObject:@(_strokeThoughtLineStyle) forKey:NSStrikethroughStyleAttributeName];


    /**
     *  设置属性
     */
    [self setStrokeThoughtLineLabelTextAttributes];
}

- (void)setStrokeThoughtLineStyle:(StrokeThoughtLineStyle)strokeThoughtLineStyle
{
    _strokeThoughtLineStyle = strokeThoughtLineStyle;
    

    //添加属性:中划线
    [_attributes setObject:@(_strokeThoughtLineStyle) forKey:NSStrikethroughStyleAttributeName];


    
    
    
    if ([self.text isEmpty])
    {
        /**
         *  设置属性
         */
        [self setStrokeThoughtLineLabelTextAttributes];
    }
}

/**
 *  设置删除线颜色
 *
 *  @param strokeThoughtLineColor <#strokeThoughtLineColor description#>
 */
- (void)setStrokeThoughtLineColor:(UIColor *)strokeThoughtLineColor
{
    _strokeThoughtLineColor = strokeThoughtLineColor;
    
    

    //添加属性:中划线颜色
    [_attributes setObject:strokeThoughtLineColor forKey:NSStrikethroughColorAttributeName];


    
    if ([self.text isEmpty])
    {
        /**
         *  设置属性
         */
        [self setStrokeThoughtLineLabelTextAttributes];
    }
}

/**
 *  设置属性
 */
- (void)setStrokeThoughtLineLabelTextAttributes
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedString addAttributes:_attributes range:NSMakeRange(0, self.text.length)];
    
    self.attributedText = attributedString;
}

#pragma mark - getter
- (NSString *)text
{
    return _text;
}


@end
