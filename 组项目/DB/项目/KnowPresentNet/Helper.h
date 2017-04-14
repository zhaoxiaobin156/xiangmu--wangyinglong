//
//  Helper.h
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

// 手机号码验证
+ (BOOL)justMobile:(NSString *)mobile;

// 密码
+ (BOOL)justPassword:(NSString *)passWord;

@end
