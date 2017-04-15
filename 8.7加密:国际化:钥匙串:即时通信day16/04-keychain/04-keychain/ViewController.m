//
//  ViewController.m
//  04-keychain
//
//  Created by vera on 16/8/8.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "SFHFKeychainUtils.h"
#import <AdSupport/AdSupport.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //注意：用SFHFKeychainUtils这个库编译会报错，因为这个库是MRC状态，需要在Build Phases -> Compile Sources里的第三方库文件中添加-fno-objc-arc
    
    //实现多个设备不能同时登陆：
    
    //保存(App删除后数据还存在，Reset Content and Settings设备后数据就不在了)
    /*
     参数1：key
     参数2：value
     参数3：组(服务器)的名字
     参数4：如果替换存在的数据
     */
//    [SFHFKeychainUtils storeUsername:@"xiaoming" andPassword:@"123456" forServiceName:@"qianfeng.com.dasfds.-4-keychain" updateExisting:NO error:nil];
    
    //获取
    NSString *string = [SFHFKeychainUtils getPasswordForUsername:@"xiaoming" andServiceName:@"qianfeng.com.dasfds.-4-keychain" error:nil];
    
    NSLog(@"密码 = %@",string);
    
    [self deviceUDID解决方案];
}

- (void)deviceUDID解决方案
{
    //FF56EA91-E456-4178-B8FD-EA842B575B7A
    //EBEAFDF2-2AAE-4640-AFFB-F38BF06CF692
    //3E8FA084-1CDB-4C7E-8079-F64130CDE807
    
    NSString *string =  [SFHFKeychainUtils getPasswordForUsername:@"deviceUDID" andServiceName:@"qianfeng.com.dasfds.-4-keychain" error:nil];
    
    if(!string)
    {
        /*
         1.广告标示符：advertisingIdentifier(iOS6)
         */
        NSUUID *uuid = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        NSString *uuidString = [uuid UUIDString];
        
        [SFHFKeychainUtils storeUsername:@"deviceUDID" andPassword:uuidString forServiceName:@"qianfeng.com.dasfds.-4-keychain" updateExisting:NO error:nil];
        
        NSLog(@"uuidString = %@",uuidString);
        //51E83164-3BA3-4D52-A49E-07A29E5AAEAC
    }
    
    NSLog(@"string = %@",string);
    //51E83164-3BA3-4D52-A49E-07A29E5AAEAC
    
    /*
     第2种：Vendor标示符(iOS6)
     */
    NSUUID *uuid = [[UIDevice currentDevice] identifierForVendor];
    
    //每次结果不一样
    NSLog(@"%@",uuid.UUIDString);
    
    /*
     第3种：创建一个UUID，然后用KeyChain
     */
    //创建UUID
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    
    //把uuidRef转化为String
    CFStringRef stringRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    NSString *udid_str = (__bridge NSString *)(stringRef);
    
    //每次结果不一样
    NSLog(@"%@",udid_str);
    
    CFRelease(stringRef);

    CFRelease(uuidRef);
    
    //获取Info.plist文件
//    [[NSBundle mainBundle] infoDictionary];
    
    /*
     第4种：推送token＋bundle_id的方法：
     
     应用中增加推送用来获取token
     获取应用bundle_id
     根据token+bundle_id进行散列运算
     apple push token保证设备唯一，但必须有网络情况下才能工作，该方法不依赖于设备本身，但依赖于apple push，而苹果push有时候会抽风的
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
