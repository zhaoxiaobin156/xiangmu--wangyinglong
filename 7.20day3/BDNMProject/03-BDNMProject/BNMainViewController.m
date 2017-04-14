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
#import "BNLoadErrorView.h"
#import "BNRecommendBuy.h"
#import "BNMainActivetime.h"

@interface BNMainViewController ()

@property (nonatomic, weak) BNMainContentView *mainContentView;

/**
 *  热门店铺的数据源
 */
@property (nonatomic, strong) NSMutableArray *hotShopArray;

/**
 *  精选抢购
 */
@property (nonatomic, strong) NSMutableArray *recommendShopArray;

/**
 *  活动时间
 */
@property (nonatomic, strong) NSMutableArray *activeTimeArray;

@end

@implementation BNMainViewController

#pragma mark - 懒加载-get方法
- (NSMutableArray *)activeTimeArray
{
    if (!_activeTimeArray)
    {
        _activeTimeArray = [NSMutableArray array];
    }
    
    return _activeTimeArray;
}


- (NSMutableArray *)recommendShopArray
{
    if (!_recommendShopArray)
    {
        _recommendShopArray = [NSMutableArray array];
    }
    
    return _recommendShopArray;
}

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
     *  请求热门店铺信息数据
     */
    [self startRequestDataFromNetworkingWithUrlString:kMainHotShopUrl];
    
    /**
     *  请求分类信息
     */
    [self startRequestDataFromNetworkingWithUrlString:kMainCategoryUrl];

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
- (void)startRequestDataFromNetworkingWithUrlString:(NSString *)urlString
{
    [HttpRequest GET:urlString parmaters:nil succuss:^(id responseObject)
    {
        //热门店铺
        if ([urlString isEqualToString:kMainHotShopUrl])
        {
            //1.封装数据
            [self handleHotShopData:responseObject[@"data"][@"tuan_list"]];
            
            //2.刷新界面
            self.mainContentView.hotShopArray = self.hotShopArray;
        }
        //精选抢购
        else
        {
            //1.封装数据
            [self handleCategoryData:responseObject[@"data"]];
            
            //2.刷新界面
            self.mainContentView.activeTimeArray = self.activeTimeArray;
            self.mainContentView.recommendShopArray = self.recommendShopArray;
            
        }
        
    } failure:^(NSError *error) {
        
        
#if 0
        [BNLoadErrorView dismissInView:self.view];
        //显示加载失败的界面
        [BNLoadErrorView showInView:self.view dismiss:^{
            
            /**
             *  重新网络请求
             */
            // [self startRequestDataFromNetworking];
        }];
#endif
        
        
#if 0
        BOOL isHotShopRequestFail = NO;
        BOOL isCategroyRequestFail = NO;
        
        if ([urlString isEqualToString:kMainHotShopUrl])
        {
            isHotShopRequestFail = YES;
        }
        
        if ([urlString isEqualToString:kMainCategoryUrl])
        {
            isCategroyRequestFail = YES;
        }
        
        if (isHotShopRequestFail && isCategroyRequestFail)
        {
            //显示加载失败的界面
            [BNLoadErrorView showInView:self.view dismiss:^{
                
                /**
                 *  重新网络请求
                 */
                // [self startRequestDataFromNetworking];
            }];
        }

#endif
    }];
}

#pragma mark - 处理分类的信息
- (void)handleCategoryData:(NSDictionary *)responseObject
{
    responseObject = responseObject[@"topten"];
    
    //精选抢购
    for (NSDictionary *dic in responseObject[@"list"])
    {
        BNRecommendBuy *recommend = [BNRecommendBuy baseModelWithDictiaoary:dic];
        
        [self.recommendShopArray addObject:recommend];
    }
    
    //活动时间
    for (NSDictionary *dic in responseObject[@"activetime"])
    {
        BNMainActivetime *activeTime = [BNMainActivetime baseModelWithDictiaoary:dic];
        
        [self.activeTimeArray addObject:activeTime];
    }
}

#pragma mark - 处理热门店铺的信息
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
