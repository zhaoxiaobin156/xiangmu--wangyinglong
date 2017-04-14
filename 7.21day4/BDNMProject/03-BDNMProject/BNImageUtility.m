//
//  BNImageUtility.m
//  03-BDNMProject
//
//  Created by vera on 16/7/20.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNImageUtility.h"

@implementation BNImageUtility

/**
 *  对图片url处理
 *
 *  @param urlString <#urlString description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)urlStringForImageWithUrlString:(NSString *)urlString
{
    NSString *resultUrlString = nil;
    
    //1.截取图片url
    NSRange range = [urlString rangeOfString:@"src="];
    
    //找到了
    if (range.location != NSNotFound)
    {
        resultUrlString = [urlString substringFromIndex:range.location + range.length];
        
        //2.解码:把以前的编码去掉
        resultUrlString = [resultUrlString stringByRemovingPercentEncoding];
        
        return resultUrlString;
    }
    
    return urlString;
}

@end
