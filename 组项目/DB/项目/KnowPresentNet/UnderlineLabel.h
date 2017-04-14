//
//  UnderlineLabel.h
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, UnderlineLineStyle)
{
    UnderlineLineStyleNone = 0x00,
    UnderlineLineStyleSingle = 0x01,
    UnderlineLineStyleThick = 0x02,
    UnderlineLineStyleDouble = 0x09
};

@interface UnderlineLabel : UILabel
{
    
}

/**
 *  文字
 */
@property (nonatomic, copy) NSString *text;

/**
 *  删除线的颜色
 */
@property (nonatomic, strong) UIColor *underlineLineColor;

/**
 *  删除线的样式
 */
@property (nonatomic) UnderlineLineStyle underlineLineStyle;


@end
