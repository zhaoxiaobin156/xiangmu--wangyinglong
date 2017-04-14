//
//  ViewController.m
//  04-UIImageView播放图片动画
//
//  Created by vera on 16/7/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, strong) NSMutableArray *animationImages;

@end

@implementation ViewController

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drink_00"]];
        imageView.bounds = self.view.bounds;
        imageView.center = self.view.center;
        [self.view addSubview:imageView];
        
        _imageView = imageView;
    }
    
    return _imageView;
}

- (NSMutableArray *)animationImages
{
    if (!_animationImages)
    {
        _animationImages = [NSMutableArray array];
        
        for (int i = 0; i <= 80; i++)
        {
            NSString *imageName = [NSString stringWithFormat:@"drink_%02d",i];
            
            UIImage *image = [UIImage imageNamed:imageName];
            
            [_animationImages addObject:image];
        }
    }
    
    return _animationImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.播放的图片
    self.imageView.animationImages = self.animationImages;
    
    //2.动画时间
    self.imageView.animationDuration = self.animationImages.count * 0.1;
    
    //3.播放次数(0表示无限次)
    self.imageView.animationRepeatCount = 1;
    
    //4.开始动画
    [self.imageView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
