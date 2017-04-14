//
//  TaticTableViewCell.m
//  KnowPresentNet
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TaticTableViewCell.h"

@implementation TaticTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/** 重写setter方法 */
-(void)setMod:(TacticModel *)mod{
    
    _mod = mod;
    
    self.imgView.image = [UIImage imageNamed:@"body_pic"];
    self.titleLabel.text = _mod.title;
    self.commentnumLabel.text = _mod.commentnum;
    self.hitsLabel.text = _mod.hits;
    self.shareLabel.text = _mod.share;
    self.favoritenumLabel.text = _mod.favoritenum;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
