//
//  CaresubjectViewController.m
//  KnowPresentNet
//
//  Created by mac on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CaresubjectViewController.h"
#import "CaresubjectOneModel.h"
#import "CaresubjectTableViewCell.h"

@interface CaresubjectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *mytableView;

@property(nonatomic,strong)NSMutableArray *dataSource;

@property(nonatomic,assign)int strRow;

@end

@implementation CaresubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    _strRow = 1;
    
    [self creatUI];
}

-(NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    
    return _dataSource;
}

//-(UITableView *)myTableView
//{
//    
//    if (_mytableView == nil) {
//        _mytableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)style:UITableViewStylePlain];
//        _mytableView.delegate = self;
//        _mytableView.dataSource = self;
//        
//        [_mytableView registerNib:[UINib nibWithNibName:@"CaresubjectTableViewCell" bundle:nil] forCellReuseIdentifier:@"CTcell"];
//        
//        [self.view addSubview:_mytableView];
//    }
//    return _mytableView;
//}

-(void)creatUI
{
    _mytableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W,SCREEN_H)style:UITableViewStylePlain];
    _mytableView.delegate = self;
    _mytableView.dataSource = self;
    
    [_mytableView registerNib:[UINib nibWithNibName:@"CaresubjectTableViewCell" bundle:nil] forCellReuseIdentifier:@"CTcell"];
    [self.view addSubview:_mytableView];
   
}

-(void)getDataFromNet:(NSInteger)row
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSLog(@"===%@", app.dict);
    
    [MyNetWorking postDataWithString:CaringTopicURL andParam:@{@"token":app.dict[@"token"], @"uid":app.dict[@"userid"]} complicationBlock:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            
            NSLog(@"%@", connectionError);
            
        } else {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
//            NSLog(@"dic --- %@", dic);
            
            CaresubjectOneModel *model = [[CaresubjectOneModel alloc]initWithDictionary:dic error:nil];
            
            [self.dataSource addObject:model];
            
            [self.mytableView reloadData];
        }
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"dic --- %ld", self.dataSource.count);
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CaresubjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CTcell" forIndexPath:indexPath];
    
    CaresubjectOneModel *OneModel = self.dataSource[indexPath.row];
    
    [cell refreshUI:OneModel];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
