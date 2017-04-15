//
//  ScanViewController.m
//  01-QRCodeScan
//
//  Created by vera on 16/8/6.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ScanViewController.h"
#import "QRCodeScanView.h"

@interface ScanViewController ()
{
    QRCodeScanView *_qrCodeScanView;
}

@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    QRCodeScanView *qrCodeScanView = [[QRCodeScanView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:qrCodeScanView];
    _qrCodeScanView = qrCodeScanView;
    
    //开始扫描
    [qrCodeScanView startScan];
    
    [qrCodeScanView setQRCodeScanDidFinishCallback:^(NSString *value) {
        
#if 0
        //对结果进行处理
        if ([value hasPrefix:@"http://"] || [value hasPrefix:@"https://"])
        {
            [[[UIAlertView alloc] initWithTitle:@"扫描到url" message:value delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
        else if ([value hasPrefix:@"mqq://"])
        {
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"打开QQ" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
        else if ([value hasPrefix:@"pay://"])
        {
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"打开支付界面" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
#endif
        
        [[[UIAlertView alloc] initWithTitle:@"提示" message:value delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        
    }];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //重新开始扫描
    [_qrCodeScanView startScan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
