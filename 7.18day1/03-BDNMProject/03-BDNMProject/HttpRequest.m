//
//  HttpRequest.m
//  03-BDNMProject
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "HttpRequest.h"
#import "AFNetworking.h"

@implementation HttpRequest

/**
 *  GET请求
 *
 *  @param urlString <#urlString description#>
 *  @param parmaters <#parmaters description#>
 *  @param success   <#success description#>
 *  @param failure   <#failure description#>
 */
+ (void)GET:(NSString *)urlString parmaters:(NSDictionary *)parmaters succuss:(HttpRequestDidSuccessCallback)success failure:(HttpRequestFailureCallback)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:parmaters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
    }];
}

#if 0
+ (void)GET2:(NSString *)urlString parmaters:(NSDictionary *)parmaters succuss:(HttpRequestDidSuccessCallback)success failure:(HttpRequestFailureCallback)failure
{
    NSURLSession *session = [NSURLSession sharedSession];
    //创建一个请求对象
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error && failure)
        {
            failure(error);
        }
        else
        {
            if (success)
            {
                //1.解析
                id responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                //2.回调
                success(responseObject);
            }
        }
        
    }];
    //发送异步请求
    [task resume];
}
#endif


@end
