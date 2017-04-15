//
//  ViewController.m
//  01-TCP发送消息
//
//  Created by vera on 16/8/10.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
//TCP
#import "GCDAsyncSocket.h"
#import "DDXML.h"

//主机地址
#define kHostName @"10.20.158.31"
//端口
#define kHostPort 54321

@interface ViewController ()<GCDAsyncSocketDelegate>
{
    //套接字对象
    GCDAsyncSocket *_socket;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    //连接到指定主机地址和端口服务器
    [_socket connectToHost:kHostName onPort:kHostPort error:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(sendMessage) userInfo:nil repeats:NO];
    
    //[NSTimer timerWithTimeInterval:1 target:self selector:@selector(sendMessage) userInfo:nil repeats:YES];
    
    
}

- (void)sendMessage
{
    NSString *message = @"在不在";
    
    /*
    <message type="chat" to="test2@127.0.0.1">
      <body>
       111
      </body>
    </message>
     */
    DDXMLElement *messageElement = [DDXMLElement elementWithName:@"message"];
    
    [messageElement addAttribute:[DDXMLNode attributeWithName:@"type" stringValue:@"chat"]];
    [messageElement addAttribute:[DDXMLNode attributeWithName:@"to" stringValue:@"test2@127.0.0.1"]];
    
    DDXMLElement *bodyElement = [DDXMLElement elementWithName:@"body" stringValue:@"在不在"];
    [messageElement addChild:bodyElement];
    
    
    //发送消息
    [_socket writeData:[[messageElement description] dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
    //接收消息
    [_socket readDataWithTimeout:-1 tag:0];
}

#pragma mark - GCDAsyncSocketDelegate
/**
 *  已经连接到主机地址
 *
 *  @param sock <#sock description#>
 *  @param host <#host description#>
 *  @param port <#port description#>
 */
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"连接成功");
}

/**
 *  断开连接
 *
 *  @param sock <#sock description#>
 *  @param err  <#err description#>
 */
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    NSLog(@"已经断开连接");
}

/**
 *  收到服务器消息
 *
 *  @param sock <#sock description#>
 *  @param data <#data description#>
 *  @param tag  <#tag description#>
 */
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    //获取服务器的消息
    NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"服务器：%@",message);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
