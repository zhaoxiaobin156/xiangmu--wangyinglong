//
//  NSString+Additional.m
//  01-runtime用途
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "NSString+Additional.h"
#import <objc/runtime.h>

@implementation NSString (Additional)

//声明一个唯一地址的key
const char *key;

- (void)setName:(NSString *)name
{
    NSLog(@"setName：方法调用了");
    
    //关联(OBJC_ASSOCIATION_COPY_NONATOMIC是设定该value在object内的属性，即assgin,(retain,nonatomic)...等)
    objc_setAssociatedObject(self, &key, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name
{
    //return @"sss";
    
    //取值
    return objc_getAssociatedObject(self, &key);
}

@end
