//
//  ViewController.m
//  02-ShareSDKDemo
//
//  Created by vera on 16/8/5.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

@interface ViewController ()

@end

@implementation ViewController

/**
 *  根据对应平台，登录
 *
 *  @param platform <#platform description#>
 */
- (void)thirdLoginWithPlatform:(SSDKPlatformType)platform
{
    //第三方登录
    //第一个回调：
    //1.在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息
    //2.在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式，将社交用户的uid作为关联ID传入associateHandler
    [SSEThirdPartyLoginHelper loginByPlatform:platform onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
        
        associateHandler (user.uid, user, user);
        
    } onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
        
        //登录成功
        if (state == SSDKResponseStateSuccess)
        {
            //判断是否已经在用户列表中，避免用户使用同一账号进行重复登录
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"登录成功" delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil] show];
        }
        
    }];
}

/**
 *  新浪微博第三方登录
 *
 *  @param sender <#sender description#>
 */
- (IBAction)login:(id)sender
{
    [self thirdLoginWithPlatform:SSDKPlatformTypeSinaWeibo];
}
/**
 *  腾讯微博第三方登录
 *
 *  @param sender <#sender description#>
 */
- (IBAction)tencentWeiboLogin:(id)sender
{
    [self thirdLoginWithPlatform:SSDKPlatformTypeTencentWeibo];
}

/**
 *  第三方分享
 *
 *  @param sender <#sender description#>
 */
- (IBAction)shareButtonClick:(id)sender
{
    //1、创建分享参数(只能分享一张)
    //注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传image参数：images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]
    NSArray* imageArray = @[[UIImage imageNamed:@"c75c10385343fbf2c6e17e6eb27eca8064388faa"]];
    
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        
        //设置分享参数
        [shareParams SSDKSetupShareParamsByText:@"哈哈哈哈哈" images:imageArray url:[NSURL URLWithString:@"http://mob.com"] title:@"分享标题" type:SSDKContentTypeAuto];
        
        //2.分享(可以弹出我们的分享菜单和编辑界面)
        //参数一：要显示菜单的视图，iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view对象，iPhone可以传nil不会影响
        [ShareSDK showShareActionSheet:nil items:nil shareParams:shareParams onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
            
            switch (state) {
                    
                case SSDKResponseStateSuccess:
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享成功" message:nil delegate:nil cancelButtonTitle:@"确定"otherButtonTitles: nil];
                    [alert show];
                    break;
                }
                    
                case SSDKResponseStateFail:
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败" message:nil delegate:nil cancelButtonTitle:@"确定"otherButtonTitles: nil];
                    [alert show];
                    break;
                }
                    
                default:
                    break;
            }
            
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
