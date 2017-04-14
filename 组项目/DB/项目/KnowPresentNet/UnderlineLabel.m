//
//  UnderlineLabel.m
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UnderlineLabel.h"


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

@interface UnderlineLabel ()
{
    NSString *_text;
    
    /**
     *  文字属性
     */
    NSMutableDictionary *_attributes;
}

@end

@implementation UnderlineLabel


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
    
    _underlineLineColor = kTextDefalutColor;
    
    _underlineLineStyle = UnderlineLineStyleSingle;
}

#pragma mark - setter
- (void)setText:(NSString *)text
{
    _text = text;

    //添加属性:下划线
    [_attributes setObject:@(_underlineLineStyle) forKey:NSUnderlineStyleAttributeName];

    /**
     *  设置属性
     */
    [self setUnderlineLineLabelTextAttributes];
}

- (void)setUnderlineLineStyle:(UnderlineLineStyle)underlineLineStyle
{
    _underlineLineStyle = underlineLineStyle;
    


    //添加属性:下划线
    [_attributes setObject:@(_underlineLineStyle) forKey:NSUnderlineStyleAttributeName];

    
    
    
    if ([self.text isEmpty])
    {
        /**
         *  设置属性
         */
        [self setUnderlineLineLabelTextAttributes];
    }
}

/**
 *  设置删除线颜色
 *
 *  @param strokeThoughtLineColor <#strokeThoughtLineColor description#>
 */
- (void)setUnderlineLineColor:(UIColor *)underlineLineColor
{
    _underlineLineColor = underlineLineColor;
    
    

    //添加属性:下划线颜色
    [_attributes setObject:underlineLineColor forKey:NSUnderlineColorAttributeName];

    
    if ([self.text isEmpty])
    {
        /**
         *  设置属性
         */
        [self setUnderlineLineLabelTextAttributes];
    }
}

/**
 *  设置属性
 */
- (void)setUnderlineLineLabelTextAttributes
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
