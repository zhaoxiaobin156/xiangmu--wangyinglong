//
//  BNMainRecommendBuyCell.h
//  03-BDNMProject
//
//  Created by vera on 16/7/20.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNMainActivetime.h"

@interface BNMainRecommendBuyCell : UITableViewCell

@property (nonatomic, strong) NSArray *shops;

@property (nonatomic, strong) BNMainActivetime *activeTime;

//图片
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;

@end
