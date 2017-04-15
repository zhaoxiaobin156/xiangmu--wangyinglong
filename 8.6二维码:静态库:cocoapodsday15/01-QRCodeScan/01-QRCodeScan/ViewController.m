//
//  ViewController.m
//  01-QRCodeScan
//
//  Created by vera on 16/8/6.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ScanViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 iOS7之前：用第3方:ZBar、ZXing、mrc 扫描效率比较低
 iOS7之后：AVFoundation
 
 注意：模拟器上不能扫描，会奔溃
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#if 0
    //虚拟摄像头设备
    AVCaptureDevice;
    
    //输入设备
    AVCaptureDeviceInput;
    
    //输出设备
    AVCaptureMetadataOutput;
    
    //输入与输出的桥梁
    AVCaptureSession;
    
    //显示画面的层
    AVCaptureVideoPreviewLayer;
    
    //采集的数据信息
    AVMetadataMachineReadableCodeObject;
#endif
 
}

- (IBAction)buttonClick:(id)sender
{
    ScanViewController *scanCtrl = [[ScanViewController alloc] init];
    [self presentViewController:scanCtrl animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
