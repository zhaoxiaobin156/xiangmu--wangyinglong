//
//  BNMainViewController.m
//  03-BDNMProject
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNMainViewController.h"
#import "BNMainContentView.h"
#import "HttpRequest.h"
#import "BNUrl.h"
#import "BNShop.h"

@interface BNMainViewController ()

@property (nonatomic, weak) BNMainContentView *mainContentView;

/**
 *  热门店铺的数据源
 */
@property (nonatomic, strong) NSMutableArray *hotShopArray;

@end

@implementation BNMainViewController

#pragma mark - 懒加载-get方法
- (NSMutableArray *)hotShopArray
{
    if (!_hotShopArray)
    {
        _hotShopArray = [NSMutableArray array];
    }
    
    return _hotShopArray;
}

- (BNMainContentView *)mainContentView
{
    if (!_mainContentView)
    {
        BNMainContentView *mainContentView = [[BNMainContentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49)];
        [self.view addSubview:mainContentView];
        
        _mainContentView = mainContentView;
    }
    
    return _mainContentView;
}

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    /**
     *  网络请求数据
     */
    [self startRequestDataFromNetworking];
    
    
}

#pragma mark - setter方法
- (void)setName
{
    
}


- (void)setTest
{
    
}

- (void)setxxxx
{
    
}

#pragma mark - 网络数据请求
/**
 *  网络请求数据
 */
- (void)startRequestDataFromNetworking
{
    [HttpRequest GET:kMainHotShopUrl parmaters:nil succuss:^(id responseObject)
    {
        //1.封装数据
        [self handleHotShopData:responseObject[@"data"][@"tuan_list"]];
        
        //2.刷新界面
        self.mainContentView.hotShopArray = self.hotShopArray;
        
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",[error localizedDescription]);
        
    
    }];
}

#pragma mark - 处理数据模型
/**
 *  处理热门店铺的信息
 */
- (void)handleHotShopData:(NSArray *)shops
{
    for (NSDictionary *dic in shops)
    {
        BNShop *shop = [BNShop baseModelWithDictiaoary:dic];
        
        //添加到数据源
        [self.hotShopArray addObject:shop];
    }
}

#pragma mark - Event Handle

#pragma mark - Other

#pragma mark - 代理方法



/*************  补充知识  ****************/
#if 0
//判断设备是iphone,ipad
1.UIDevice的model
2. 建议采用的方法：
if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
{
    NSLog(@"iPhone");
}
else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
{
    NSLog(@"iPad");
}
3.屏幕的宽和高判断


//app的版本
[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
#endif



@end
