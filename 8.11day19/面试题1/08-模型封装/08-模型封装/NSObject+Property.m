//
//  NSObject+Property.m
//  08-模型封装
//
//  Created by vera on 16/1/9.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

//获取类的所有属性
+ (NSArray *)properties
{
    NSMutableArray *attributeArray = [NSMutableArray array];
    
    unsigned int outCount = 0;
    
    //获取指定类的所有属性
    objc_property_t *properties = class_copyPropertyList(self, &outCount);
    
    //遍历所有的属性
    for (int i = 0; i < outCount; i++)
    {
        //取每一个属性
        objc_property_t property = properties[i];
        //获取属性名字
        const char *name = property_getName(property);
        //const char *attr = property_getAttributes(property);
        
        NSString *attributeName = [NSString stringWithUTF8String:name];
        //NSString *attrString = [NSString stringWithUTF8String:attr];
        
        //NSLog(@"%@",[self attributeType:attrString]);
        
        [attributeArray addObject:attributeName];
    }
    
    return attributeArray;
}

@end
