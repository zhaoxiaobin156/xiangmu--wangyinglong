//
//  UIImage+CaptureSize.h
//  KnowPresentNet
//
//  Created by Mac1 on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CaptureSize)

// 图片截取功能
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

@end
