//
//  NSObject+Model.h
//  08-模型封装
//
//  Created by vera on 16/1/9.
//  Copyright © 2016年 vera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

//把字典转化为model
+ (id)objectWithDictionary:(NSDictionary *)dictionary;
+ (id)objectWithJsonString:(NSString *)jsonString;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (id)initWithJsonString:(NSString *)jsonString;

@end
