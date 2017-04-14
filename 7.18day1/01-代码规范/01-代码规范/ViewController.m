//
//  ViewController.m
//  01-代码规范
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

#define kLoginButtonTag 1

//NS_ENUM(枚举的类型, 枚举名字)
typedef NS_ENUM(NSInteger, ButtonType)
{
    ButtonTypeCustom,
    ButtonTypeNormal
    
};

@interface ViewController ()
{
    /**
     *  苹果规范
     */
    UIButton *_loginButton;
    
    ButtonType _type;
    
    NSString *_kind;
    
    
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 0; i < 10; i++) {
        
    }
    
    BOOL isMe;
    
    if (!isMe)
    {
        //好友消息
    }
    else
    {
        //自己消息
    }
    
    
    NSInteger buttonTag;
    
    if (buttonTag == kLoginButtonTag)
    {
        
    }
    else if (buttonTag == 2)
    {
        
    }

    
    UIViewController *viewController;
    UIViewController *viewCtrl;
    
    NSObject *xiaoming;
    
        
    /*
     2000行
     */
    
}

/**
 *  登录
 */
- (void)login
{
 
    
}

/**
 *  登录
 *
 *  @param username 用户名
 *  @param password 密码
 */
- (void)loginWithUsername:(NSString *)username password:(NSString *)password
{
    
}


/**
 *  <#Description#>
 *
 *  @param name <#name description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)stringWithName:(NSString *)name
{
    return  @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
