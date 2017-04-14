//
//  ShoppingCarCell.m
//  04-购物车动画
//
//  Created by vera on 16/8/1.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ShoppingCarCell.h"

@interface ShoppingCarCell ()
{
    ShoppingCarCellDidClickShoppingCarButtonCallback _shoppingCarCellDidClickShoppingCarButtonCallback;
}

@end

@implementation ShoppingCarCell

/**
 *  加入购物车
 *
 *  @param sender <#sender description#>
 */
- (IBAction)shoppingCarButtonClick:(UIButton *)sender
{
    NSLog(@"%@",NSStringFromCGPoint(sender.center));
    
#if 0
    //point从A坐标转化为B的坐标
    [A convertPoint:point toView:B];
    [B convertPoint:point fromView:A];
#endif
    
    //坐标点转化
    CGPoint startPoint = [self convertPoint:sender.center toView:self.superview];
    
    /**
     *  回调
     */
    if (_shoppingCarCellDidClickShoppingCarButtonCallback)
    {
        _shoppingCarCellDidClickShoppingCarButtonCallback(startPoint);
    }
}

/**
 *  设置加入购物车的回调
 *
 *  @param callback <#callback description#>
 */
- (void)setShoppingCarCellDidClickShoppingCarButtonCallback:(ShoppingCarCellDidClickShoppingCarButtonCallback)callback
{
    _shoppingCarCellDidClickShoppingCarButtonCallback = callback;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
