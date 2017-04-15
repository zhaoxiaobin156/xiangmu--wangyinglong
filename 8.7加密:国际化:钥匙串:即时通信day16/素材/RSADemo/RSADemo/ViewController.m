//
//  ViewController.m
//  RSADemo
//
//  Created by vera on 15/6/12.
//  Copyright (c) 2015年 vera. All rights reserved.
//

#import "ViewController.h"
#import "RSA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDLuwt30JLYFvKcFOUdjPuDRdqv\nSnDb5TSdA/w0ND/GwLExpT66DeRz9+6//G//Y0y3c/yWT14k/ab1vID4U6W3vOgr\nafC0RyuIgH8ooCTNQpU+LtIoZ6qCejnux7VZ5lwWeT/9DQjWOtf6TopeRdzmOX09\nwa7c5xGGUsmi29QxDQIDAQAB\n-----END PUBLIC KEY-----";
   
    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCLEII59BlfW2uQq2U+55sxVRbgsv+VRRcQvLHFxHQ+T1HijbcXKE5Bnv+CZ4TLVraGIzuJVp4MkQzzb+amhzMVC7J49FgOijxTfe8ic7gwoKB04g1aDPVmDrBkuSw+rRKtcwHrw7jFyfv1pLLJ8h9+WONp4MRrN3igfs0hXSRCBQIDAQAB\n-----END PUBLIC KEY-----";
    NSString *ret = [RSA encryptString:@"hello world!" publicKey:pubkey];
    NSLog(@"encrypted: %@", ret);
        
    NSLog(@"%@",NSHomeDirectory());
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
