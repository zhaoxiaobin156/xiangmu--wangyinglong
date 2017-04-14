//
//  BNHotShopCell.m
//  03-BDNMProject
//
//  Created by vera on 16/7/19.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNHotShopCell.h"
#import "UIImageView+WebCache.h"
#import "StrokeThoughtLineLabel.h"

@interface BNHotShopCell ()

/**
 *  图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *shopIconImageView;

/**
 *  店铺名字
 */
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;

/**
 *  当前距离
 */
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

/**
 *  子标题
 */
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

/**
 *  团购价
 */
@property (weak, nonatomic) IBOutlet UILabel *groupPriceLabel;

/**
 *  市场价格
 */
@property (weak, nonatomic) IBOutlet StrokeThoughtLineLabel *marketPriceLabel;

/**
 *  评分
 */
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation BNHotShopCell

- (void)setShop:(BNShop *)shop
{
    _shop = shop;
    
    //刷新子视图
    [self refreshSubViews];
}

- (void)refreshSubViews
{
    [self.shopIconImageView sd_setImageWithURL:[NSURL URLWithString:[self urlStringForImageWithUrlString:_shop.image]] placeholderImage:[UIImage imageNamed:@"ugc_image"]];
    self.shopNameLabel.text    = _shop.brand_name;
    self.distanceLabel.text    = _shop.distance;
    self.subTitleLabel.text    = _shop.short_title;
    self.groupPriceLabel.text  = [NSString stringWithFormat:@"￥ %ld",[_shop.groupon_price integerValue]/100];
    
    
    self.marketPriceLabel.strokeThoughtLineStyle = StrokeThoughtLineStyleThick;
//    //删除线的颜色
//    self.marketPriceLabel.strokeThoughtLineColor = [UIColor redColor];
    self.marketPriceLabel.text = [NSString stringWithFormat:@"%ld",[_shop.market_price integerValue]/100];
    
   
    
    self.scoreLabel.text       = _shop.score_desc;
}

/**
 *  对图片url处理
 *
 *  @param urlString <#urlString description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)urlStringForImageWithUrlString:(NSString *)urlString
{
    NSString *resultUrlString = nil;
    
    //1.截取图片url
    NSRange range = [urlString rangeOfString:@"src="];
    
    //找到了
    if (range.location != NSNotFound)
    {
        resultUrlString = [urlString substringFromIndex:range.location + range.length];
        
        //2.解码:把以前的编码去掉
        resultUrlString = [resultUrlString stringByRemovingPercentEncoding];
        
        return resultUrlString;
    }
    
    return urlString;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
