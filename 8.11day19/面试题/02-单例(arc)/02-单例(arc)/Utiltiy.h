//
//  Utiltiy.h
//  02-单例(arc)
//
//  Created by vera on 16/8/12.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 单例：单个实例，在当前的应用程序的生命周期内，该对象只有实例
 
 单例优点：解耦合，传值
 单例缺点：单例对象占用一定的内存
 注意：单例的生命周期和应用程序的生命周期是一样的
 
 arc的单例：
 1.定义一个类方法，该方法返回的是当前单例对象的一个实例
 2.定义一个静态的当前的单例对象的一个实例，并且赋值为nil
 3.判断当前单例对象是否为空，如果为空就创建
 4.重写allocWithZone:方法，保证调用alloc不会创建一个新的对象
 5.重写copyWithZone:方法和mutableCopyWithZone:方法
 */

@interface Utiltiy : NSObject

+ (instancetype)utility;

@end
