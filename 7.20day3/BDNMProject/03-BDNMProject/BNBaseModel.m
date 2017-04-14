//
//  BNBaseModel.m
//  03-BDNMProject
//
//  Created by vera on 16/7/19.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNBaseModel.h"

@implementation BNBaseModel

+ (id)baseModelWithDictiaoary:(NSDictionary *)dictionary
{
    BNBaseModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dictionary];
        
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

@end
