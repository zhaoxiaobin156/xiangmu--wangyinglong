//
//  TacticView.m
//  KnowPresentNet
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TacticView.h"
#import "TacticModel.h"
#import "TaticTableViewCell.h"

@interface TacticView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation TacticView

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.tableView.frame = self.bounds;
}

-(void)awakeFromNib{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TaticTableViewCell" bundle:nil] forCellReuseIdentifier:@"TaticTableViewCell"];
    
    [self addSubview:self.tableView];
}

-(NSMutableArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark --- UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TaticTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaticTableViewCell" forIndexPath:indexPath];
    
    TacticModel *mod = self.dataSource[indexPath.row];
    cell.mod = mod;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}

@end
