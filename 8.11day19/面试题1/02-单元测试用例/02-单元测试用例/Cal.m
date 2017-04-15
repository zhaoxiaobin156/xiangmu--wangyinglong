//
//  Cal.m
//  02-单元测试用例
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "Cal.h"

@implementation Cal

+ (int)sum:(int)a b:(int)b
{
    if (a < 0 || b < 0)
    {
        return 0;
    }
    
    return  a + b;
}

@end
