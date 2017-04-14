//
//  MyNetWorking.m
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MyNetWorking.h"

@implementation MyNetWorking

+ (void)getDataWithString:(NSString *)url andParam:(NSDictionary *)dict complicationBlock:(MyNetWorkingBlock)block
{
    NSString *param = [self stringFromDict:dict];
    NSString *urlStr = [NSString stringWithFormat:@"%@?%@", url, param];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        block(response, data, connectionError);
    }];
}

+ (void)postDataWithString:(NSString *)url andParam:(NSDictionary *)dict complicationBlock:(MyNetWorkingBlock)block
{
    NSString *param = [self stringFromDict:dict];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    request.HTTPMethod = @"POST";
    
    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        block(response, data, connectionError);
    }];
}

// 辅助方法:
// 目的：字典转成字符串:
// @{@"username":@"ios16060001", @"password":@"123456"}
// ---> @"username=ios16060001&password=123456"
+ (NSString *)stringFromDict:(NSDictionary *)dict
{
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    
    for (NSString *key in dict) {
        
        NSString *str = [NSString stringWithFormat:@"%@=%@", key, dict[key]];
        [arrM addObject:str];
    }
    //    username=ios16060001&password=123456
    return [arrM componentsJoinedByString:@"&"];// 以&符号连接;
}

@end
