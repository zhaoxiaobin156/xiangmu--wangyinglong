//
//  MyNetWorking.h
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyNetWorkingBlock)(NSURLResponse *response, NSData *data, NSError *connectionError);

@interface MyNetWorking : NSObject

// 参数一：连接地址
// 参数二: 地址参数
// 参数三：回调block
+ (void)getDataWithString:(NSString *)url andParam:(NSDictionary *)dict complicationBlock:(MyNetWorkingBlock)block;


+ (void)postDataWithString:(NSString *)url andParam:(NSDictionary *)dict complicationBlock:(MyNetWorkingBlock)block;

@end
