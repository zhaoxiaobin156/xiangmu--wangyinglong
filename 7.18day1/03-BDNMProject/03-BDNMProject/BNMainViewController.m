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

@interface BNMainViewController ()

@property (nonatomic, weak) BNMainContentView *mainContentView;

@end

@implementation BNMainViewController

- (BNMainContentView *)mainContentView
{
    if (!_mainContentView)
    {
        BNMainContentView *mainContentView = [[BNMainContentView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:mainContentView];
        
        _mainContentView = mainContentView;
    }
    
    return _mainContentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    /**
     *  网络请求数据
     */
    [self startRequestDataFromNetworking];
}

/**
 *  网络请求数据
 */
- (void)startRequestDataFromNetworking
{
    
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
    
    
    
    
    

    
    //[HttpRequest GET:<#(NSString *)#> parmaters:<#(NSDictionary *)#> succuss:<#^(id responseObject)success#> failure:<#^(NSError *error)failure#>]
}


@end
