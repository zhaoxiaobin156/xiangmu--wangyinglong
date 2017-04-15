//
//  NSString+DES.h
//  常用加密算法Demo
//
//  Created by vera on 15/10/18.
//  Copyright © 2015年 vera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DES)

- (NSString *)DESEncryptWithKey:(NSString *)key;

- (NSString *)DESDecrypWithKey:(NSString *)key;

@end
