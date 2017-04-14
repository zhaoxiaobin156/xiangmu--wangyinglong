//
//  BNMainRecommendBuyCell.m
//  03-BDNMProject
//
//  Created by vera on 16/7/20.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNMainRecommendBuyCell.h"
#import "BNRecommendBuy.h"
#import "UIImageView+WebCache.h"
#import "BNImageUtility.h"

@interface BNMainRecommendBuyCell ()

//图片
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *nameLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *priceLabels;

@end

@implementation BNMainRecommendBuyCell

- (void)setShops:(NSArray *)shops
{
    _shops = shops;
    
    
    /**
     *  赋值
     */
    [shops enumerateObjectsUsingBlock:^(BNRecommendBuy *recommendShop, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIImageView *imageView = self.imageViews[idx];
        UILabel *nameLabel = self.nameLabels[idx];
        UILabel *priceLabel = self.priceLabels[idx];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:[BNImageUtility urlStringForImageWithUrlString:recommendShop.na_logo]] placeholderImage:[UIImage imageNamed:@"icon_tab_shouye_normal_light"]];
        nameLabel.text = recommendShop.brand;
        priceLabel.attributedText = [self priceAttributedStringWithRecommendShop:recommendShop];
        
    }];
    
}

- (NSAttributedString *)priceAttributedStringWithRecommendShop:(BNRecommendBuy *)recommendShop
{
    
    //当前价格
    NSString *currentPrice = [NSString stringWithFormat:@"￥%0.1f",[recommendShop.current_price floatValue]/100];
    //市场价格
    NSString *marketPrice = [NSString stringWithFormat:@"%0.1f",[recommendShop.market_price floatValue]/100];
    NSString *space = @" ";
    
    
    
    /*
    NSTextAttachment *face = [[NSTextAttachment alloc] init];
    face.image = [UIImage imageNamed:@"Expression_63"];
     
     NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:[NSAttributedString attributedStringWithAttachment:face]];
     */
    
    //属性字符串
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] init];
    [string.mutableString appendString:currentPrice];
    [string.mutableString appendString:space];
    [string.mutableString appendString:marketPrice];
    
    [string addAttributes:@{
                            NSFontAttributeName: [UIFont systemFontOfSize:10],
                            NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}
                    range:NSMakeRange(currentPrice.length + space.length, marketPrice.length)];
    
    return string;
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
