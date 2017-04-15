//
//  UIImage+Resize.m
//  02-二维码和条形码生成
//
//  Created by vera on 16/8/6.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

- (UIImage *)resizableImageWithSize:(CGSize)size
{
    UIImage *image;
    
    //图片上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    //设置二维码图片质量
    CGContextSetInterpolationQuality(UIGraphicsGetCurrentContext(), kCGInterpolationNone);
    
    //绘制上下文
    [self drawInRect:CGRectMake(0, 0, 300, 300)];
    
    //从当前上下文中获取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图片上下文
    UIGraphicsEndImageContext();
    
    return image;
}


@end
