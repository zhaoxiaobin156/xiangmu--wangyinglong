//
//  StrokeThoughtLineLabel.h
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, StrokeThoughtLineStyle)
{
    StrokeThoughtLineStyleNone = 0x00,
    StrokeThoughtLineStyleSingle = 0x01,
    StrokeThoughtLineStyleThick = 0x02,
    StrokeThoughtLineStyleDouble = 0x09
};

@interface StrokeThoughtLineLabel : UILabel
{
    
}

/**
 *  文字
 */
@property (nonatomic, copy) NSString *text;

/**
 *  删除线的颜色
 */
@property (nonatomic, strong) UIColor *strokeThoughtLineColor;

/**
 *  删除线的样式
 */
@property (nonatomic) StrokeThoughtLineStyle strokeThoughtLineStyle;

@end
