//
//  ManagerViewController.m
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ManagerViewController.h"

@interface ManagerViewController ()<UISearchControllerDelegate,UISearchResultsUpdating>

{
    UISearchController *_search; //搜索控制器
    NSMutableArray *_resultArrM; //搜索结果数组
    BOOL _isSearch; //是否在搜索状态
}
@end

@implementation ManagerViewController

#pragma mark - 初始化

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        UIImage *normalImage = [UIImage reSizeImage:[UIImage imageNamed:@"tab_icon_grey_guanxiguanli"] toSize:CGSizeMake(30, 30)];
        
        //设置选中时的图标
        UIImage *selectedImage=[UIImage reSizeImage:[UIImage imageNamed:@"tab_icon_red_guanxiguanli"] toSize:CGSizeMake(30, 30)];
        
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"关系管理" image:normalImage selectedImage:selectedImage];
        
        

        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:242/255.0 blue:243/255.0 alpha:1];
    [self createSearchController];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
   
    
  

}

#pragma mark - 懒加载-get方法
//模型数组
-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

//字符串数组
-(NSMutableArray *)dataArrM
{
    if (!_dataArrM) {
        _dataArrM = [[NSMutableArray alloc] init];
    }
    return _dataArrM;
}


-(NSMutableArray *)resultArrM
{
    if (!_resultArrM) {
        _resultArrM = [[NSMutableArray alloc] init];
    }
    return _resultArrM;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 创建UI

- (void)createSearchController
{
    
    _resultArrM = [[NSMutableArray alloc] init];
    //参数代表是否有控制接收
    //nil 代表在当前控制器上显示
    _search = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    //是否在搜索的时候使底色变暗
    _search.dimsBackgroundDuringPresentation = YES;
    
    //UIView根据自己的内容来变化Frame的大小
    [_search.searchBar sizeToFit];
    
    //设置代理
    _search.searchResultsUpdater = self;
    _search.delegate = self;
    
    
    //设置搜索框提示文字
    _search.searchBar.placeholder = @"搜索联系人/手机";
    
    //设置搜索框颜色
    _search.searchBar.barTintColor = [UIColor whiteColor];
    
    _search.hidesNavigationBarDuringPresentation = NO; //导航滚动时不隐藏
    
    //搜索框放在tableview的表头
    //    self.tableView.tableHeaderView = _search.searchBar;
    
    self.navigationItem.titleView = _search.searchBar;
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CYHOneTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CYHOneTitleCell" forIndexPath:indexPath];
    
    
    
    return cell;
}


#pragma mark -- UISearchControllerDelegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    //点击搜索进入搜索状态
    _isSearch = YES;
    
    //删除上一次搜索的结果
    [self.resultArrM removeAllObjects];
    
    //查找数据源是否有搜索内容
    for(NSString *string in self.dataArrM)
    {
        if ([string rangeOfString:_search.searchBar.text].location != NSNotFound)
        {
            [self.resultArrM addObject:string];
        }
    }
    
    //刷新tableview
    [self.tableView reloadData];
    
}

- (void)didDismissSearchController:(UISearchController *)searchController
{
    //搜索结束
    _isSearch = NO;
    [self.tableView reloadData];
    
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
   
}


@end
