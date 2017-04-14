//
//  BNMainActivetime.h
//  03-BDNMProject
//
//  Created by vera on 16/7/20.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNBaseModel.h"

@interface BNMainActivetime : BNBaseModel

/**
 *  活动的结束时间
 */
@property (nonatomic, strong) NSNumber *endtime;

/**
 *  活动的开始时间
 */
@property (nonatomic, strong) NSNumber *starttime;

@end
