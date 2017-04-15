//
//  ViewController.m
//  02-国际化
//
//  Created by vera on 16/8/8.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //从Localizable.string中指定key的value(默认加载Localizable.string)
//    NSLocalizedString(<#key#>, <#comment#>)
    
    //参数一：key
    //参数二：国际化的文件名字
    //参数三：解释
//    NSLocalizedStringFromTable(<#key#>, <#tbl#>, <#comment#>)
    
    /**
     *  1.本地数据国际化
     */
    UIButton *loginButton =[UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(30, 50, 100, 50);
    loginButton.backgroundColor = [UIColor lightGrayColor];
    [loginButton setTitle:NSLocalizedString(@"loginButtonTitle", @"这是登录按钮标题") forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 70, 40)];
    l.text = NSLocalizedString(@"labelText", nil);
    [self.view addSubview:l];
    
    /**
     *  2.App名字国际化：不需要写代码，只需要创建一个InfoPlist.string文件(文件名固定)，然后添加需要的语言，再输入键值对(需要在Info.plist文件中添加Bundle display name)
     */
    
    /**
     *  3.网络数据国际化：服务器做，我们只需要告诉服务器我们需要哪种语言的数据
     *
     *  @return <#return value description#>
     */
    
    //zh-Hant-US -> 繁体中文
    //en-US -> 英文
    //zh-Hans-US -> 简体中文
    
    //注意：在iOS9之前，所有语言的后缀没有-US
    
    //获取系统当前语言
    NSString *language = [[NSLocale preferredLanguages] firstObject];
    
    NSLog(@"系统当前语言 = %@",language);
    
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 9.0)
    {
        if ([language isEqualToString:@"zh-Hant-US"])
        {
            NSLog(@"繁体中文");
        }
        else if ([language isEqualToString:@"en-US"])
        {
            NSLog(@"英文");
        }
        else
        {
            NSLog(@"其他语言");
        }
    }
    else
    {
        if ([language isEqualToString:@"zh-Hant"])
        {
            NSLog(@"繁体中文");
        }
        else if ([language isEqualToString:@"en"])
        {
            NSLog(@"英文");
        }
        else
        {
            NSLog(@"其他语言");
        }
    }
    
    /**
     *  4.资源文件(音视频，文件，图片等)
     *
     *  @return <#return value description#>
     */
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 200, 200, 200)];
    [self.view addSubview:imageView];
    NSString *imageName = NSLocalizedString(@"imageName", nil);
    imageView.image = [UIImage imageNamed: imageName];
    
    /**
     *  5.xib和storyboard
     *
     *  @return <#return value description#>
     */
    //见下个Demo
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
