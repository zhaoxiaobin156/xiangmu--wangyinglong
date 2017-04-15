//
//  ViewController.m
//  04-蓝牙交互
//
//  Created by vera on 16/8/10.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "BlueToothManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //蓝牙需要在真机上才能测试
    
    [[BlueToothManager manager] scanPeripherals:^(NSArray *peripherals) {
        
    }];
    
    Byte byte[2];
    
    //command_id
    byte[0] = 0x02;
    
    //key
    byte[1] = 0x01;
    
    //发送获得设备基本信息请求
    [[BlueToothManager manager] writeData:[NSData dataWithBytes:byte length:2] uuidString:@"0x0AF7"];
    
    Byte byte2[2];
    byte2[0] = 0x02;
    byte2[1] = 0x03;
    
    [[BlueToothManager manager] writeData:[NSData dataWithBytes:byte2 length:2] uuidString:@"0x0AF7"];
    
    //接收硬件返回的数据
    [[BlueToothManager manager] setBlueToothManangerDidReceiveDataCallBack:^(NSData *data) {
        
        //转成字节
        Byte *byte = (Byte *)data.bytes;
        
        //获得设备基本信息请求
        if (byte[0] == 0x02 && byte[1] == 0x01)
        {
           //获取电池的状态
            if (byte[7] == 0x00)
            {
                NSLog(@"电池正常");
            }
            else if (byte[7] == 0x01)
            {
                NSLog(@"正在充电");
            }
            else if (byte[7] == 0x02)
            {
                NSLog(@"电池充满");
            }
        }
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
