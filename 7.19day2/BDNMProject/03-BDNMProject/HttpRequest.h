//
//  HttpRequest.h
//  03-BDNMProject
//
//  Created by vera on 16/7/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  请求成功回调
 */
typedef void(^HttpRequestDidSuccessCallback)(id responseObject);

/**
 *  请求错误的回调
 *
 *  @param error <#error description#>
 */
typedef void(^HttpRequestFailureCallback)(NSError *error);

@interface HttpRequest : NSObject

/**
 *  GET请求
 *
 *  @param urlString <#urlString description#>
 *  @param parmaters <#parmaters description#>
 *  @param success   <#success description#>
 *  @param failure   <#failure description#>
 */
+ (void)GET:(NSString *)urlString parmaters:(NSDictionary *)parmaters succuss:(HttpRequestDidSuccessCallback)success failure:(HttpRequestFailureCallback)failure;

@end
