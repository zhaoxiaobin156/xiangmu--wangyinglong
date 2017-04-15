//
//  ViewController.m
//  01-加密算法
//
//  Created by vera on 16/8/8.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MD5.h"
#import "NSData+AES256.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     *  MD5加密
     */
    NSString *originString = @"123456";
    
    //MD5加密
    NSString *md5String = [originString md5];
    
    NSLog(@"MD5加密 = %@",md5String);
    
    //password = md5(md5(PWD) + 时间戳)
    NSString *password = @"123456";
    
    NSString *encryptString = [password md5];
    
    //时间戳：秒
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    
    NSInteger timeInterVal = interval * 1000;
    
    encryptString = [NSString stringWithFormat:@"%@%ld",encryptString,timeInterVal];
    
    encryptString = [encryptString md5];
    
    NSLog(@"MD5时间戳加密 = %@",encryptString);
    
    /**
     *  AES加密 -> 对称加密算法
     *
     *  @return <#return value description#>
     */
    //key表示私钥
    NSString *key = @"123456789qwertyuiopasdfghjklzxcvbnm,";
    
    //加密
    NSData *encryptData = [[originString dataUsingEncoding:4] AES256EncryptWithKey:key];
    
    //解密
    encryptString = [[NSString alloc] initWithData:[encryptData AES256DecryptWithKey:key] encoding:4];
    
    NSLog(@"AES解密 = %@",encryptString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
