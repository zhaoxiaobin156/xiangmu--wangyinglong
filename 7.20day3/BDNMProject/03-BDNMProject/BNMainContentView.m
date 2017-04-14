//
//  BNMainContentView.m
//  03-BDNMProject
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNMainContentView.h"
#import "BNHotShopCell.h"
#import "BNShop.h"
#import "BNTempMainHotShopCell.h"
#import "BNMainRecommendBuyCell.h"
#import "BNMainActivetime.h"

@interface BNMainContentView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *hotShopTableView;

@end

@implementation BNMainContentView

#pragma mark - 懒加载
- (UITableView *)hotShopTableView
{
    if (!_hotShopTableView)
    {
        UITableView *tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self addSubview:tableView];
        
        [tableView registerNib:[UINib nibWithNibName:@"BNHotShopCell" bundle:nil] forCellReuseIdentifier:@"BNHotShopCell"];
        [tableView registerClass:[BNTempMainHotShopCell class] forCellReuseIdentifier:@"BNTempMainHotShopCell"];
        [tableView registerNib:[UINib nibWithNibName:@"BNMainRecommendBuyCell" bundle:nil] forCellReuseIdentifier:@"BNMainRecommendBuyCell"];
        
        _hotShopTableView = tableView;
    }
    
    return _hotShopTableView;
}

#pragma mark - setter方法
- (void)setHotShopArray:(NSArray *)hotShopArray
{
    //1.赋值
    _hotShopArray = hotShopArray;
    
    //2.刷新
    [self.hotShopTableView reloadData];
}

- (void)setRecommendShopArray:(NSArray *)recommendShopArray
{
    //1.赋值
    _recommendShopArray = recommendShopArray;
    
    //2.刷新
    [self.hotShopTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    
}

#pragma mark - layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.hotShopTableView.frame = self.bounds;
}

#if 0
- (BNMainActivetime *)currentActiveTime
{
    for (BNMainActivetime *activeTime in self.activeTimeArray)
    {
        //   startTime < 当前时间 < endTime
        
        /*
         注意：在真实项目中，currentSeconds需要替换服务器时间，为了防止用户修改时间。
         */
        
        //当前系统的时间
        NSDate *date = [NSDate date];
        //从1970年至今的总秒数
        NSTimeInterval currentSeconds = [date timeIntervalSince1970];
        
        if (currentSeconds > startTime && currentSeconds < endTime)
        {
            return activeTime;
        }
    }
}
#endif

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 + self.hotShopArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        BNMainRecommendBuyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BNMainRecommendBuyCell"];
        
        cell.shops = self.recommendShopArray;
        
        if (self.activeTimeArray.count > 0)
        {
            BNMainActivetime *activeTime = [self.activeTimeArray firstObject];
            
            //TODO:
        }
        
        return cell;
    }
    else
    {
        BNHotShopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BNHotShopCell"];
        
        BNShop *shop = self.hotShopArray[indexPath.row - 1];
        cell.shop = shop;
        
#if 0
        BNTempMainHotShopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BNTempMainHotShopCell"];
        BNShop *shop = self.hotShopArray[indexPath.row];
        cell.shop = shop;
#endif
        
        return cell;

    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 165;
    }
    
    return 100;
}

@end
