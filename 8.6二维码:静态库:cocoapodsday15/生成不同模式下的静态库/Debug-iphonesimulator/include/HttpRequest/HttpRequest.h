//
//  HttpRequest.h
//  HttpRequest
//
//  Created by vera on 16/8/6.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject

//1.模式选择：Product -> Scheme -> Edit Scheme...
//2.Command + B编译即可生成对应的静态库

/**
 *  get方法
 */
+ (void)GET;

@end
