//
//  ViewController.m
//  02-二维码和条形码生成
//
//  Created by vera on 16/8/6.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Resize.h"

@interface ViewController ()

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, weak) UIImageView *barImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //获取系统支持的滤镜名字
    NSLog(@"%@",[CIFilter filterNamesInCategory:nil]);
    
    //二维码
    self.imageView.image = [self createQRcodeAndBarcodeWithMessage:@"我欲封天" codeName:@"CIQRCodeGenerator"];
    
    //条形码
    self.barImageView.image = [self createQRcodeAndBarcodeWithMessage:@"1234567890" codeName:@"CICode128BarcodeGenerator"];
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(30, 40, 300, 300);
        [self.view addSubview:imageView];
        
        _imageView = imageView;
    }
    
    return _imageView;
}

- (UIImageView *)barImageView
{
    if (!_barImageView)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(30, 350, 300, 300);
        [self.view addSubview:imageView];
        
        _barImageView = imageView;
    }
    
    return _barImageView;
}

/**
 *  创建二维码或者条形码
 *
 *  @param message  二维码或者条形码的内容
 *  @param codeName 二维码或者条形码
 *
 *  @return <#return value description#>
 */
- (UIImage *)createQRcodeAndBarcodeWithMessage:(NSString *)message codeName:(NSString *)codeName
{
    //1.滤镜类
    CIFilter *filter = [CIFilter filterWithName:codeName];
    
    //2.设置二维码或者条形码值
    [filter setValue:[message dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
    
    //3.获取二维码或者条形码
    CIImage *ciImage = [filter outputImage];
    
    //4.创建伪造颜色滤镜
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    
    NSLog(@"%@",[colorFilter inputKeys]);
    
    //要处理的图片
    [colorFilter setValue:ciImage forKey:@"inputImage"];
    
    //设置颜色
    [colorFilter setValue:[CIColor colorWithCGColor:[UIColor purpleColor].CGColor] forKey:@"inputColor0"];
    
    //设置背景颜色
    [colorFilter setValue:[CIColor colorWithCGColor:[UIColor lightGrayColor].CGColor] forKey:@"inputColor1"];
    
    //获取处理过的图片
    CIImage *colorImage = [colorFilter outputImage];
    
    //5.把CIImage转化为UIImage
    UIImage *image = [UIImage imageWithCIImage:colorImage];
    
    return [image resizableImageWithSize:CGSizeMake(300, 300)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
