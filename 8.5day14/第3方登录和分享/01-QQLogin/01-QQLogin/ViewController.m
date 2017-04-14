//
//  ViewController.m
//  01-QQLogin
//
//  Created by vera on 16/8/5.
//  Copyright © 2016年 deli. All rights reserved.
//

/*
 常用app的URL Scheme：
 淘宝宝贝搜索 taobao://http://s.taobao.com/?q=[prompt]
 淘宝店铺搜索 taobao://http://shopsearch.taobao.com/browse/shop_search.htm?q=[prompt]
 
 omnifocus:///add?name=[prompt]&note=[clipboard]
 mdict://[prompt]
 
 QQ是mqq://
 微信是weixin://
 淘宝taobao://
 点评dianping:// dianping://search
 微博sinaweibo://
 名片全能王camcard://
 weico微博weico://
 支付宝alipay://
 豆瓣fm：doubanradio://
 微盘sinavdisk://
 网易公开课ntesopen://
 美团imeituan://
 京冬openapp.jdmoble://
 人人renren://
 我查查wcc://
 1号店wccbyihaodian://
 有道词典yddictproapp://
 知乎zhihu://
 优酷youku://
 */

#import "ViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>

//不要忘记导入，否则工程报错
#import <TencentOpenAPI/TencentApiInterface.h>

@interface ViewController ()<TencentSessionDelegate,TencentLoginDelegate>
{
    TencentOAuth *_tencentOAuth;
}

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

//头像
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

//昵称
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     1.把iOS_SDK_V3.1.0添加到工程里面(TencentOpenApi_IOS_Bundle.bundle，TencentOpenAPI.framework)
     
     2.添加必要的依赖库：分别是Security.framework，libiconv.dylib，SystemConfiguration.framework，CoreGraphics.Framework，libsqlite3.dylib，CoreTelephony.framework，libstdc++.dylib，libz.dylib
     
     3.添加scheme = tencent + appId
     
     4.修改必要的代码：确保Info.plist文件中Bundle display name属性的存在
     */
    
    //判断是否安装QQ
    /*
     在在iOS9中，如果用到canOpenURL:这个方法需要在Info.plist添加URL Scheme名单
     
     <key>LSApplicationQueriesSchemes</key>
     <array>
     <string>URL Scheme1</string>
     <string>URL Scheme2</string>
     </array>
     */
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]])
    {
        NSLog(@"已经安装QQ");
        
        self.loginButton.hidden = NO;
    }
    else
    {
        NSLog(@"没有安装QQ");
        
        //        self.loginButton.hidden = YES;
    }
}

/**
 *  QQ第三方登录
 *
 *  @param sender <#sender description#>
 */
- (IBAction)qqLogin:(id)sender
{
    //授权对象
    _tencentOAuth = [[TencentOAuth alloc] initWithAppId:@"1105520737" andDelegate:self];
    
    //权限
    NSArray* permissions = [NSArray arrayWithObjects:
    kOPEN_PERMISSION_GET_USER_INFO,
    kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
    kOPEN_PERMISSION_ADD_ALBUM,
    kOPEN_PERMISSION_ADD_ONE_BLOG,
    kOPEN_PERMISSION_ADD_SHARE,
    kOPEN_PERMISSION_ADD_TOPIC,
    kOPEN_PERMISSION_CHECK_PAGE_FANS,
    kOPEN_PERMISSION_GET_INFO,
    kOPEN_PERMISSION_GET_OTHER_INFO,
    kOPEN_PERMISSION_LIST_ALBUM,
    kOPEN_PERMISSION_UPLOAD_PIC,
    kOPEN_PERMISSION_GET_VIP_INFO,
    kOPEN_PERMISSION_GET_VIP_RICH_INFO,
    nil];
    
    //开始授权(登录)
    [_tencentOAuth authorize:permissions inSafari:NO];
}

#pragma mark - TencentLoginDelegate

/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin
{
    //获取用户当前信息：这句代码不能放到分线程里面
    //里面的具体请求是在分线程中
    [_tencentOAuth getUserInfo];
    
    //openId就是当前QQ用户的唯一标识
    NSLog(@"openId ＝ %@",_tencentOAuth.openId);

    [[[UIAlertView alloc] initWithTitle:@"提示" message:@"登录成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    //主动退出登录
    if (cancelled)
    {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"退出登录成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }
    else
    {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"登录失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }
}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork
{
    [[[UIAlertView alloc] initWithTitle:@"提示" message:@"网络故障" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

/**
 * 获取用户个人信息回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/getUserInfoResponse.exp success
 *          错误返回示例: \snippet example/getUserInfoResponse.exp fail
 */
- (void)getUserInfoResponse:(APIResponse*) response
{
    NSLog(@"判断是否是主线程：%d",[NSThread isMainThread]);
    
    //获取用户信息列表
    NSDictionary *info = response.jsonResponse;
    
    NSLog(@"城市 = %@",info[@"city"]);
    NSLog(@"昵称 = %@",info[@"nickname"]);
    
    NSLog(@"用户信息列表 = %@",info);
    
    //重新请求头像
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:info[@"figureurl_qq_2"]]]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.nicknameLabel.text = info[@"nickname"];
        self.headImageView.image = image;
    
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
