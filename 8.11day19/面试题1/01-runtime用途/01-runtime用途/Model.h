//
//  Model.h
//  01-runtime用途
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic) int age;
@property (nonatomic, copy) NSString *address;

@end
