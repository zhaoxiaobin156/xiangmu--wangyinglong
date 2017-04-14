//
//  UIImage+Watermark.m
//  03-图片加水印
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "UIImage+Watermark.h"

@implementation UIImage (Watermark)

/**
 *  图片添加水印
 *
 *  @param text <#text description#>
 *
 *  @return <#return value description#>
 */
- (UIImage *)watermarkWithText:(NSString *)text
{
    /*
      图片上下文能够实现：
     1.加水印
     2.合成图片
     3.压缩
     */
    
    //先绘制当前图片，然后在绘制指定文字，最后合成一张新的图片
    //如果需要合成图片，需要创建图片上下文
    
    //UIImageJPEGRepresentation(<#UIImage * _Nonnull image#>, <#CGFloat compressionQuality#>)
    
    //1.开始图片上下文
    /*
     参数一：新的图片的大小
     参数二：是否不透明：YES表示不透明
     参数三：0表示比例自动调整
     */
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    
    //2.把图片绘制到指定区域，如果宽度或者高度值比原图的高度或者宽小的，就是图片压缩
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    //3.绘制文字
    [text drawAtPoint:CGPointMake(10, 10) withAttributes:@{NSForegroundColorAttributeName: [UIColor redColor],NSFontAttributeName: [UIFont fontWithName:@"Snell Roundhand" size:40]}];
    
    //4.获取当前上下文的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.关闭当前上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
