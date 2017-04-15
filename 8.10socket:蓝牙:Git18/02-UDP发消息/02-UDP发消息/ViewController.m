//
//  ViewController.m
//  02-UDP发消息
//
//  Created by vera on 16/8/10.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncUdpSocket.h"

@interface ViewController ()<GCDAsyncUdpSocketDelegate>
{
    //发送端
    GCDAsyncUdpSocket *_sendSocket;
    
    //接收端
    GCDAsyncUdpSocket *_recSocket;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //心跳(❤️)包
    
    _sendSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    //绑定端口
    [_sendSocket bindToPort:12345 error:nil];
    
    _recSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    //绑定端口
    [_recSocket bindToPort:54321 error:nil];
    
    //开始接收
    [_recSocket beginReceiving:nil];
    
    //模拟发送
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_sendSocket sendData:[@"在不在？" dataUsingEncoding:NSUTF8StringEncoding] toHost:@"10.20.158.31" port:54321 withTimeout:-1 tag:0];
    });
}

#pragma mark - GCDAsyncUdpSocket
/**
 *  已经发送数据成功
 *
 *  @param sock <#sock description#>
 *  @param tag  <#tag description#>
 */
- (void)udpSocket:(GCDAsyncUdpSocket *)sock didSendDataWithTag:(long)tag
{
    if (_sendSocket == sock)
    {
        NSLog(@"已经发送成功");
    }
}

/**
 *  接收到对方消息
 *
 *  @param sock          <#sock description#>
 *  @param data          <#data description#>
 *  @param address       <#address description#>
 *  @param filterContext <#filterContext description#>
 */
- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data
      fromAddress:(NSData *)address
withFilterContext:(id)filterContext
{
    
    NSString *hostName;
    uint16_t port;
    
    //获取对方的IP和端口
    [GCDAsyncUdpSocket getHost:&hostName port:&port fromAddress:address];
    
    NSLog(@"收到来自%@:%d的消息%@",hostName,port,[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
