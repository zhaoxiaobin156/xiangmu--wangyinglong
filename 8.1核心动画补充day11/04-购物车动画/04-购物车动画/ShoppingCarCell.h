//
//  ShoppingCarCell.h
//  04-购物车动画
//
//  Created by vera on 16/8/1.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  加入购物车回调
 */
typedef void(^ShoppingCarCellDidClickShoppingCarButtonCallback)(CGPoint startPoint);

@interface ShoppingCarCell : UITableViewCell

/**
 *  设置加入购物车的回调
 *
 *  @param callback <#callback description#>
 */
- (void)setShoppingCarCellDidClickShoppingCarButtonCallback:(ShoppingCarCellDidClickShoppingCarButtonCallback)callback;

@end
