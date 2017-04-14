//
//  BNTempMainHotShopCell.m
//  03-BDNMProject
//
//  Created by vera on 16/7/20.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNTempMainHotShopCell.h"
#import "Masonry.h"
#import "StrokeThoughtLineLabel.h"
#import "UIImageView+WebCache.h"

@interface BNTempMainHotShopCell ()

/**
 *  图片
 */
@property (weak, nonatomic) UIImageView *shopIconImageView;

/**
 *  店铺名字
 */
@property (weak, nonatomic) UILabel *shopNameLabel;

/**
 *  当前距离
 */
@property (weak, nonatomic) UILabel *distanceLabel;

/**
 *  子标题
 */
@property (weak, nonatomic) UILabel *subTitleLabel;

/**
 *  团购价
 */
@property (weak, nonatomic) UILabel *groupPriceLabel;

/**
 *  市场价格
 */
@property (weak, nonatomic) StrokeThoughtLineLabel *marketPriceLabel;

/**
 *  评分
 */
@property (weak, nonatomic) UILabel *scoreLabel;



@end

@implementation BNTempMainHotShopCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //注意：如果用代码frame布局，千万不要在此方法中设置frame。所有的控件的frame放到layoutSubviews中。
        
        /**
         *  图片
         */
        [self.shopIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(80);
            make.left.mas_equalTo(self.contentView).offset(10);
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        /**
         *  店铺名字
         */
        [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).offset(10);
            make.left.mas_equalTo(self.shopIconImageView.mas_right).offset(5);
        }];
        
        /**
         *  距离
         */
        [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.shopNameLabel);
            make.right.mas_equalTo(self.contentView).offset(-10);
            make.width.mas_equalTo(50);
        }];
        
        /**
         *  子标题
         */
        [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.shopNameLabel);
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.distanceLabel);
        }];
        
        /**
         *  团购价格
         */
        [self.groupPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.subTitleLabel);
            make.bottom.mas_equalTo(self.contentView).offset(-10);
        }];
        
        /**
         *  市场价格
         */
        [self.marketPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.groupPriceLabel.mas_right).mas_equalTo(15);
            make.centerY.equalTo(self.groupPriceLabel);
            
        }];
        
        /**
         *  评分
         */
        [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.subTitleLabel);
            make.bottom.equalTo(self.groupPriceLabel);
        }];
        
        
    }
    
    return self;
}

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

#pragma mark - 创建label
/**
 *  创建label
 *
 *  @return <#return value description#>
 */
- (UILabel *)createLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:label];
    
    return label;
}

#pragma mark - 懒加载

- (StrokeThoughtLineLabel *)marketPriceLabel
{
    if (!_marketPriceLabel)
    {
        StrokeThoughtLineLabel *l = [[StrokeThoughtLineLabel alloc] init];
        l.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:l];
        
        _marketPriceLabel = l;
    }
    
    return _marketPriceLabel;
}

- (UILabel *)scoreLabel
{
    if (!_scoreLabel)
    {
        _scoreLabel = [self createLabel];
    }
    
    return _scoreLabel;
}

- (UILabel *)groupPriceLabel
{
    if (!_groupPriceLabel)
    {
        _groupPriceLabel = [self createLabel];
    }
    
    return _groupPriceLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel)
    {
        _subTitleLabel = [self createLabel];
    }
    
    return _subTitleLabel;
}

- (UILabel *)distanceLabel
{
    if (!_distanceLabel)
    {
        _distanceLabel = [self createLabel];
    }
    
    return _distanceLabel;
}

- (UILabel *)shopNameLabel
{
    if (!_shopNameLabel)
    {
        _shopNameLabel = [self createLabel];
    }
    
    return _shopNameLabel;
}

- (UIImageView *)shopIconImageView
{
    if (!_shopIconImageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ugc_image"]];
        //关闭autoResizing
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:imageView];
        
        _shopIconImageView = imageView;
    }
    
    return _shopIconImageView;
}

@end
