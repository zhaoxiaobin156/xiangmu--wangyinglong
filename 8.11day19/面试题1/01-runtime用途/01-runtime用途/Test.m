//
//  Test.m
//  01-runtime用途
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "Test.h"

@implementation Test

+ (instancetype)testWithDictionary:(NSDictionary *)dictionary
{
    Test *test = [[self alloc] init];
    
    //遍历字典所有的键
    for (NSString *key in dictionary.allKeys)
    {
        [test setValue:dictionary[key] forKey:key];
    }
    
    return test;
}

@end
