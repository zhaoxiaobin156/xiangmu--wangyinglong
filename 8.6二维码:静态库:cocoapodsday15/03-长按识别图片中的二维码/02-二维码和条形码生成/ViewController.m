//
//  ViewController.m
//  02-二维码和条形码生成
//
//  Created by vera on 16/8/6.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Resize.h"

//导入头文件
#import <CoreImage/CoreImage.h>

@interface ViewController ()
{
    //图片识别
    CIDetector *_detector;
}

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, weak) UIImageView *barImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandle:)];
    [self.imageView addGestureRecognizer:longPressGesture];
    
    //CIDetectorTypeQRCode：表示二维码识别(目前不能识别条形码)
    _detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    
    //二维码
    self.imageView.image = [self createQRcodeAndBarcodeWithMessage:@"越南媒体" codeName:@"CIQRCodeGenerator"];
    
//    self.imageView.image = [UIImage imageNamed:@"apic14052"];
    
    //条形码
    self.barImageView.image = [self createQRcodeAndBarcodeWithMessage:@"1234567890" codeName:@"CICode128BarcodeGenerator"];
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(30, 40, 300, 300);
        imageView.userInteractionEnabled = YES;
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

/**
 *  长按识别图片中的二维码
 *
 *  @param longPress <#longPress description#>
 */
- (void)longPressHandle:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan)
    {
        //识别图片中的二维码
        NSArray<CIFeature *> *features = [_detector featuresInImage:[CIImage imageWithCGImage:self.imageView.image.CGImage]];
        
        if (features.count > 0)
        {
            //1.识别到了图片中的二维码(CIQRCodeFeature：二维码的特征)
            CIQRCodeFeature *feature = (CIQRCodeFeature *)features.firstObject;
            
            //2.获取二维码中的内容
            NSString *message = feature.messageString;
            
            [[[UIAlertView alloc] initWithTitle:@"扫描结果" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:@"扫描结果" message:@"图片中没有二维码" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
