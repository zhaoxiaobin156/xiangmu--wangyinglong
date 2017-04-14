//
//  ViewController.m
//  StrokeThoughtLineLabelDemo
//
//  Created by vera on 16/7/19.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "StrokeThoughtLineLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    StrokeThoughtLineLabel *label = [[StrokeThoughtLineLabel alloc] initWithFrame:self.view.bounds];
    label.font = [UIFont systemFontOfSize:30];
    //label.textColor = [UIColor redColor];
    label.text = @"范德萨范德萨发第三方第三范德萨发第三方第三范德萨发第三方第三范德萨发第三方第三范德萨发第三方第三范德萨发第三方第三范德萨发第三方第三范德萨发第三方第三方第三方都是end";
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
