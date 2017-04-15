//
//  HttpRequest.m
//  HttpRequest
//
//  Created by vera on 16/8/6.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "HttpRequest.h"
#import "UIImage+Resize.h"

@interface NSString (Formatter)

- (void)formatter;

@end

@implementation NSString (Formatter)

- (void)formatter
{
    NSLog(@"formatter触发了");
}

@end

@implementation HttpRequest

/**
 *  get方法
 */
+ (void)GET
{
    NSLog(@"GET方法调用了");
    
    NSString *string = @"sss";
    [string formatter];
    
    UIImage *image = [[UIImage alloc] init];
    [image resizeImage];
}

@end
