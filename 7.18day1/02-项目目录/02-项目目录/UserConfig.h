//
//  UserConfig.h
//  02-项目目录
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserConfig : NSObject

/**
 *  用户id
 *
 *  @return <#return value description#>
 */
+ (NSString *)uid;

/**
 *  用户名
 *
 *  @return <#return value description#>
 */
+ (NSString *)username;

/**
 *  退出登录
 */
+ (void)loginOut;

@end
