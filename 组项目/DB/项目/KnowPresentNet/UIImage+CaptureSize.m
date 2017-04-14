//
//  UIImage+CaptureSize.m
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIImage+CaptureSize.h"

@implementation UIImage (CaptureSize)


// 图片截取功能
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}


@end
