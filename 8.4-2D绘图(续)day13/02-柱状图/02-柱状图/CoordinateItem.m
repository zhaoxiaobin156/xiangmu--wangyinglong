//
//  CoordinateItem.m
//  02-柱状图
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "CoordinateItem.h"

@implementation CoordinateItem

+ (instancetype)coordinateItemWithXValue:(NSString *)xValue yValue:(CGFloat)yValue
{
    CoordinateItem *item = [[self alloc] init];
    item.xValue = xValue;
    item.yValue = yValue;
    
    return item;
}

@end
