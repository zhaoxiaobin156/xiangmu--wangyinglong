//
//  NSString+DES.h
//  常用加密算法Demo
//
//  Created by vera on 15/10/18.
//  Copyright © 2015年 vera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DES)

/**
 *  加密
 *
 *  @param key 私钥
 *
 *  @return <#return value description#>
 */
- (NSString *)DESEncryptWithKey:(NSString *)key;

/**
 *  解密
 *
 *  @param key 私钥
 *
 *  @return <#return value description#>
 */
- (NSString *)DESDecrypWithKey:(NSString *)key;

@end
