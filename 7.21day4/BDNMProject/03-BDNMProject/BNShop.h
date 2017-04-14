//
//  BNShop.h
//  03-BDNMProject
//
//  Created by vera on 16/7/19.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNBaseModel.h"

@interface BNShop : BNBaseModel

/**
 *  店铺图片
 */
@property (nonatomic, copy) NSString *image;

/**
 *  店铺名字
 */
@property (nonatomic, copy) NSString *brand_name;

/**
 *  离当前位置的距离
 */
@property (nonatomic, copy) NSString *distance;

/**
 *  子标题
 */
@property (nonatomic, copy) NSString *short_title;

/**
 *  店铺评分
 */
@property (nonatomic, copy) NSString *score_desc;

/**
 *  市场价格
 */
@property (nonatomic, strong) NSNumber *market_price;

/**
 *  团购价格
 */
@property (nonatomic, strong) NSNumber *groupon_price;


@end
