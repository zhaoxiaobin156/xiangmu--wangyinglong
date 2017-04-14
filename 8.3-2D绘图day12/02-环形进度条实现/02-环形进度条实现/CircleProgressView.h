//
//  CircleProgressView.h
//  02-环形进度条实现
//
//  Created by vera on 16/8/3.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIView

/**
 *  进度【0，1】
 */
@property (nonatomic) CGFloat progress;

/**
 *  进度条颜色(默认值是橙色)
 */
@property (nonatomic, strong) UIColor *progressTintColor;

/**
 *  线条宽度
 */
@property (nonatomic) CGFloat lineWidth;

@end
