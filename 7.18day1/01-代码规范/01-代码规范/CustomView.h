//
//  CustomView.h
//  01-代码规范
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

/**
 *  文字
 */
@property (nonatomic, copy) NSString *title;


/**
 *  文字颜色
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 *  按钮的样式
 */
@property (nonatomic, copy) NSString *type;

@end
