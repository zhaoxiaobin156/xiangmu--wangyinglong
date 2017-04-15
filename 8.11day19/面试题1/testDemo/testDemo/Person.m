//
//  Person.m
//  testDemo
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    [_dog release];
    
    [super dealloc];
}

- (void)setDog:(Dog *)dog
{
    if (_dog != dog)
    {
        //先release旧对象，在retain新对象
        [_dog release];
        _dog = [dog retain];
    }
}

- (void)setArray:(NSMutableArray *)array
{
    _array = array;
}

@end
