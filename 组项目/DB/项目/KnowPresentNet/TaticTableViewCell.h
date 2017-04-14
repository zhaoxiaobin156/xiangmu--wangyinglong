//
//  TaticTableViewCell.h
//  KnowPresentNet
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TacticModel.h"

@interface TaticTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentnumLabel;

@property (weak, nonatomic) IBOutlet UILabel *hitsLabel;

@property (weak, nonatomic) IBOutlet UILabel *shareLabel;

@property (weak, nonatomic) IBOutlet UILabel *favoritenumLabel;

@property(nonatomic,strong)TacticModel *mod;

@end
