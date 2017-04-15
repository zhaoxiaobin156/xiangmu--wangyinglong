//
//  Utiltiy.m
//  02-单例(arc)
//
//  Created by vera on 16/8/12.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "Utiltiy.h"

@interface Utiltiy ()<NSCopying>

@end

@implementation Utiltiy

static Utiltiy *utiltiy = nil;

+ (instancetype)utility
{
    //dispatch_once是线程安全的方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!utiltiy)
        {
            utiltiy = [[self alloc] init];
        }
    });
    
    return  utiltiy;
}

//当对一个对象发送alloc消息，就会触发allocWithZone:方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!utiltiy)
        {
            utiltiy = [super allocWithZone: zone];
        }
    });
    
    return utiltiy;
}

//copy,mutableCopy一个对象的时候都会触发
- (id)copyWithZone:(nullable NSZone *)zone
{
    return self;
}

//mutableCopy一个对象的时候会触发
- (id)mutableCopyWithZone:(nullable NSZone *)zone
{
    return self;
}

//让单例不被释放
- (oneway void)release
{
    
}

- (instancetype)autorelease
{
    return self;
}

//让单例不被持有
- (instancetype)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return MAXFLOAT;
}

- (void)dealloc
{
    [super dealloc];
}





@end
