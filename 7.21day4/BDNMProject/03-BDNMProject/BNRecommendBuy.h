//
//  BNRecommendBuy.h
//  03-BDNMProject
//
//  Created by vera on 16/7/20.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNBaseModel.h"

@interface BNRecommendBuy : BNBaseModel

/**
 *  店铺名字
 */
@property (nonatomic, copy) NSString *brand;

/**
 *  当前价格
 */
@property (nonatomic, strong) NSNumber *current_price;

/**
 *  id
 */
@property (nonatomic, copy) NSString *deal_id;

/**
 *  市场价格
 */
@property (nonatomic, strong) NSNumber *market_price;

/**
 *  图片
 */
@property (nonatomic, copy) NSString *na_logo;

@end
