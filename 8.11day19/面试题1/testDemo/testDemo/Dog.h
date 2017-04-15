//
//  Dog.h
//  testDemo
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
/*
 @class作用：
 1.可以解决循环导入。
 2.@class只是告诉编译器有这个类，而不会导入类的成员变量和方法等。
 
 @class用在.h。
 */

@interface Dog : NSObject

@property (nonatomic,retain) Person *person;

@end
