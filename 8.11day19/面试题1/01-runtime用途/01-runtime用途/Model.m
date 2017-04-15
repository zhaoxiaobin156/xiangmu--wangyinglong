//
//  Model.m
//  01-runtime用途
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "Model.h"
#import <objc/runtime.h>

@implementation Model

//归档的时候调用
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    /*
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:@(self.age) forKey:@"age"];
    [aCoder encodeObject:self.address forKey:@"address"];
     */
    
    //1.获取当前类所有属性
    NSArray *properies = [self properties];
    
    //2.遍历属性
    for (NSString *propertyName in properies)
    {
        //3.归档
        [aCoder encodeObject:[self valueForKey:propertyName] forKey:propertyName];
    }
}

//解档会触发
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        /*
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [[aDecoder decodeObjectForKey:@"age"] intValue];
        self.address = [aDecoder decodeObjectForKey:@"address"];
         */
        
        //1.获取当前类所有属性
        NSArray *properies = [self properties];
        
        //2.遍历属性
        for (NSString *propertyName in properies)
        {
            //3.解归档
            [self setValue:[aDecoder decodeObjectForKey:propertyName] forKey:propertyName];
        }
    }
    
    return self;
}

- (NSArray *)properties
{
    NSMutableArray *propertiyArray = [NSMutableArray array];
    
    //属性个数
    unsigned int outCount;
    //动态获取属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    //遍历属性
    for (int i = 0; i < outCount; i++)
    {
        //属性
        objc_property_t property = properties[i];
        
        //属性的名字
        const char *name = property_getName(property);
        
        [propertiyArray addObject:[NSString stringWithUTF8String:name]];
    }
    
    return propertiyArray;

}

@end
