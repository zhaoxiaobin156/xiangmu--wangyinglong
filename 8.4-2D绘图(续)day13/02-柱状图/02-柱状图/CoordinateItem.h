//
//  CoordinateItem.h
//  02-柱状图
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CoordinateItem : NSObject

//x轴文字
@property (nonatomic, copy) NSString *xValue;

//y轴数据
@property (nonatomic) CGFloat yValue;

+ (instancetype)coordinateItemWithXValue:(NSString *)xValue yValue:(CGFloat)yValue;

@end
