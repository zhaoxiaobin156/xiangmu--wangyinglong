//
//  CaresubjectTableViewCell.h
//  KnowPresentNet
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaresubjectOneModel.h"
@interface CaresubjectTableViewCell : UITableViewCell

-(void)refreshUI:(CaresubjectOneModel *)model;

@end
