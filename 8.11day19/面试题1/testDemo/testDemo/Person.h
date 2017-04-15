//
//  Person.h
//  testDemo
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject

@property (nonatomic, retain) Dog *dog;

//mrc：retain,assign都能修饰对象。
//arc: strong,weak,assign
@property (nonatomic, assign) NSMutableArray *array;

@end
