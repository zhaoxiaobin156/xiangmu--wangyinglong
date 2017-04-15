//
//  Person.m
//  08-模型封装
//
//  Created by vera on 16/1/9.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ - %d - %@",self.name,self.age,self.address];
}

@end
