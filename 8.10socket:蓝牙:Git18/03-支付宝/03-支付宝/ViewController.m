//
//  ViewController.m
//  03-支付宝
//
//  Created by vera on 16/8/10.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 *  支付宝支付
 *
 *  @param sender <#sender description#>
 */
- (IBAction)alipay:(id)sender
{
    
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */

    //需要填写商户app申请的
    //与支付签约后支付宝分配的，以2088开头的16纯数字。
    NSString *partner = @"2088901986198025";
    //收款账号
    NSString *seller = @"ys@yaosha.com.cn";
    //私钥：找服务器要。
    NSString *privateKey = @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAM9uPRvzfKsa5xBwEf2WpthZMX2QK9mngp9BWV2FEjM/o3s5HnKFgo/FLBVV3Rz0VZaNK5Vuyy+0tYThAv6ubgnXeAlcVn8GarKaWTJeR/xU0vl6B4O43cOst6k7n7xnmlsdY4jwtfJV/miVYTShc/ASFLMEZD5DXs98jgizDQ//AgMBAAECgYAqSe45cZV8CLsM1dxFF96iAuUdFTRrZkQyFY+TilqgihvZNlbnwCJTDz6ihuPSUFnWnKdDCthvvGa5VWpX49XY28lfMnvUlVoIudfrdLpXB6APSN82lwOW0c2Dk1vCV10Sll+Pdu+mYv7UDHD+HSRHrZAy8Zn7WNqGYuCdixdpKQJBAO6UmJIjo5mm2B6AZ5L7GvSgFcDx/30ymciyHwHl+7q/uDMfqgtsYrDRYZ6ZasZ8YNvZ2ZbD70BGsJ7tY0CQYoMCQQDek2iXjr+U3/Ddg21zwtXhWzRU2OdiCwtwBOaA8BPiw1amFxO/zsauI4Xbazb4aKWJWXBC8EjTlEsjKPadmTPVAkEApI6DqZDBX9KPkII6bkuabQ4Z0wpXkXAcWCxbbMDHXyirkT+O1vA8Jf9VWMIyvpK9cAaTqQSd+fSIECZmZfrwpwJBAIbjw1GGm6j4BxvYWO79N236Pj7lrWUH2IitD5044nRdehfyiG+IO3Sx5p/R3GCz2w7ge162DQzdJKRMYRmmDXkCQQDTOLHU8jHBACw++FLSX/Bde0iNnOMufZWnWAYVOKFA9KOkI/GPHq1F50+xZX4ZbA+ER/QdCh9MtDHVjSHYY/hN";
    
    Order *order = [[Order alloc] init];
    
    //商户在支付宝签约时，支付宝为商户分配的唯一标识号(以2088开头的16位纯数字)。
    order.partner = partner;
    //卖家支付宝账号对应的支付宝唯一用户号(以2088开头的16位纯数字),订单支付金额将打入该账户,一个partner可以对应多个seller_id。
    order.sellerID = seller;
    order.outTradeNO = @"789ABCDEFGHIJKLMNOPQ"; //订单ID(由商家自行制定)
    ////商品的标题/交易标题/订单标题/订单关键字等。
    order.subject = @"衣服";
    //商品描述
    order.body = @"商品描述";
    //商品价格
    order.totalFee = @"666.66";
    //支付完成后，支付通知应用程序服务器的支付结果的地址。
    order.notifyURL = @"http://www.qianfeng.com/payStataus"; //回调URL
    
    ////接口名称，固定为mobile.securitypay.pay。
    order.service = @"mobile.securitypay.pay";
    ////具体区分本地交易的商品类型,1：实物交易; (不传情况下的默认值),0：虚拟交易; (不允许使用信用卡等规则)。
    order.paymentType = @"1";
    ////商户网站使用的编码格式，固定为utf-8。
    order.inputCharset = @"utf-8";
    //设置未付款交易的超时时间，一旦超时，该笔交易就会自动被关闭。当用户输入支付密码、点击确认付款后（即创建支付宝交易后）开始计时。取值范围：1m～15d，或者使用绝对时间（示例格式：2014-06-13 16:00:00）。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。该参数数值不接受小数点，如1.5h，可转换为90m。
    order.itBPay = @"30m";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"com.qianfeng.alipay";
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description]; NSLog(@"orderSpec = %@",orderSpec);
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循 RSA 签名规范, 并将签名字符串 base64 编码和 UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    //将签名成功字符串格式化为订单字符串,请严格按照该格式 NSString *orderString = nil;
    if (signedString != nil) {
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        //支付
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            //【callback 处理支付结果】
            NSLog(@"reslut = %@",resultDic);
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     partnerid:支付支付前需要和支付宝签约，当签约成功后，支付宝会自动分配一个partnerid(签约的支付宝账号对应的支付宝唯一用户号。以 2088 开头的 16 位纯数字 组成。).
     seller_id:卖家支付宝账号(邮箱或手机 号码格式)或其对应的支付宝 唯一用户号(以 2088 开头的 纯 16 位数字)。
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
