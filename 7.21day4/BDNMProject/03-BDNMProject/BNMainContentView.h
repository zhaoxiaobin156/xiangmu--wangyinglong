//
//  BNMainContentView.h
//  03-BDNMProject
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>

//点击热门店铺的回调
typedef void(^MainContentViewDidSelectHotShopCallback)(NSInteger index);
//点击精选抢购的回调
typedef void(^MainContentViewDidSelectRecommendCallback)(NSInteger index);

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

//点击热门店铺的回调
- (void)setMainContentViewDidSelectHotShopCallback:(MainContentViewDidSelectHotShopCallback)callback;

//点击精选抢购的回调
- (void)setMainContentViewDidSelectRecommendCallback:(MainContentViewDidSelectRecommendCallback)callback;

- (void)addRecommendTarget:(id<NSObject>)target sel:(SEL)sel;

@end
