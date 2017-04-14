//
//  BNMainContentView.h
//  03-BDNMProject
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNMainContentView : UIView

/**
 *  热门店铺
 */
@property (nonatomic, strong) NSArray *hotShopArray;

/**
 *  精选抢购
 */
@property (nonatomic, strong) NSArray *recommendShopArray;

/**
 *  活动时间
 */
@property (nonatomic, strong) NSArray *activeTimeArray;

@end
