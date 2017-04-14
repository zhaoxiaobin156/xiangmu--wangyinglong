//
//  TacticModel.h
//  KnowPresentNet
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "JSONModel.h"

@interface TacticModel : JSONModel

@property(nonatomic,copy)NSString *fengmian;

@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *commentnum;

@property(nonatomic,copy)NSString *hits;

@property(nonatomic,copy)NSString *share;

@property(nonatomic,copy)NSString *favoritenum;

@end
