//
//  ViewController.m
//  03-图片加水印
//
//  Created by vera on 16/8/4.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Watermark.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.bounds = CGRectMake(0, 0, 200, 300);
    imageView.center = self.view.center;
    imageView.image = [[UIImage imageNamed:@"c75c10385343fbf2c6e17e6eb27eca8064388faa"] watermarkWithText:@"@copyright xiaoming"];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
