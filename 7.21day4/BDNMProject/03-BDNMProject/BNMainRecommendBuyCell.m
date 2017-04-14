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
{
    NSTimer *_timer;
}


@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *nameLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *priceLabels;

/**
 *  时
 */
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;

/**
 *  分
 */
@property (weak, nonatomic) IBOutlet UILabel *minteLabel;

/**
 *  秒
 */
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

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

- (void)setActiveTime:(BNMainActivetime *)activeTime
{
    _activeTime = activeTime;
    
    
    //先销毁以前的定时器
    [_timer invalidate];
    _timer = nil;
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChangeHandle) userInfo:nil repeats:YES];
    //修改定时的mode
    /*
     NSRunLoop:事件循环机制
     主线程的NSRunLoop默认自动启动的，分线程NSRunLoop需要我们手动启动.
     
     UITrackingRunLoopMode：滚动模式
     NSDefaultRunLoopMode: 默认模式
     NSRunLoopCommonModes:一组模式
     
     主线程的runloop默认是NSDefaultRunLoopMode模型。定时器运行在NSDefaultRunLoopMode模式下：只要当前runloop处于defautl模式下，timer消息就可以处理。当滚动滚动视图，当前runloop会自动改变为UITrackingRunLoopMode：处理滚动视图消息。
     */
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
    
    
}

#pragma mark - event handle
- (void)timeChangeHandle
{
    
    //从1970年至今的总秒数
    NSTimeInterval currentSecond = [[NSDate date] timeIntervalSince1970];
    
    //活动结束的总秒数
    NSTimeInterval endSecond = [self.activeTime.endtime doubleValue];
    
    //活动的时间
    NSTimeInterval interval = endSecond - currentSecond;
    
    int h = interval / 3600;
          // (interval - h*3600) / 60
    int m = (int)interval % 3600 / 60;
          // interval - h*3600 - m*60
    int s = (int)interval % 60;
    
    self.hourLabel.text = [NSString stringWithFormat:@"%02d",h];
    self.minteLabel.text = [NSString stringWithFormat:@"%02d",m];
    self.secondLabel.text = [NSString stringWithFormat:@"%02d",s];
}

#pragma mark - other
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
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
