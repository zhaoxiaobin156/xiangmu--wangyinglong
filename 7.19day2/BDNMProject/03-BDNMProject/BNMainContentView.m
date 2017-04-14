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
        tableView.rowHeight = 100;
        [self addSubview:tableView];
        
        [tableView registerNib:[UINib nibWithNibName:@"BNHotShopCell" bundle:nil] forCellReuseIdentifier:@"BNHotShopCell"];
        
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

#pragma mark - layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.hotShopTableView.frame = self.bounds;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hotShopArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNHotShopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BNHotShopCell"];
    
    BNShop *shop = self.hotShopArray[indexPath.row];
    cell.shop = shop;
    
    return cell;
}

@end
