//
//  ViewController.m
//  07-CALayer
//
//  Created by vera on 16/7/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     UIView    CALayer
     frame      frame
     bounds     bounds
     center     position
     */
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(0, 0, 100, 100);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer1];
    
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(0, 0, 100, 100);
    layer2.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:layer2];
    
    //当前layer的位置(目前也可以理解为中心点)
    layer2.position = CGPointMake(100, 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
