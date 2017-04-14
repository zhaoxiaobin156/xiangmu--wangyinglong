//
//  UIImage+Watermark.h
//  03-图片加水印
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Watermark)

/**
 *  图片添加水印
 *
 *  @param text <#text description#>
 *
 *  @return <#return value description#>
 */
- (UIImage *)watermarkWithText:(NSString *)text;

@end
