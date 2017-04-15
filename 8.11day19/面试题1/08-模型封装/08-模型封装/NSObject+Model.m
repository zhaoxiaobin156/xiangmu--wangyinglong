//
//  NSObject+Model.m
//  08-模型封装
//
//  Created by vera on 16/1/9.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "NSObject+Model.h"
#import "NSObject+Property.h"

@implementation NSObject (Model)

//把字典转化为model
+ (id)objectWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary: dictionary];
}

+ (id)objectWithJsonString:(NSString *)jsonString
{
    return [[self alloc] initWithJsonString:jsonString];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [self init])
    {
        //获取指定的属性
       NSArray *properties = [[self class] properties];
//        id obj = [[[self class] alloc] init];
//        [obj setValue:@"test" forKey:@"name"];
        
        for (NSString *key in properties)
        {
            [self setValue:dictionary[key] forKey:key];
        }
        
        //下面这种会奔溃
#if 0
        for (NSString *key in [dictionary allKeys])
        {
            [self setValue:dictionary[key] forKey:key];
        }
#endif
    }
    
    return self;
}

- (id)initWithJsonString:(NSString *)jsonString
{
    id jsonDic = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    
    return [self initWithDictionary:jsonDic];
}

@end
