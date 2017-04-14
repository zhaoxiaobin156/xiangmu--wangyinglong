//
//  ViewController.m
//  02-环形进度条实现
//
//  Created by vera on 16/8/3.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"

@interface ViewController ()
{
    NSTimer *_timer;
}

@property (nonatomic, weak) CircleProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // CALayer <- CAShapeLayer\CATextLayer
    
    CircleProgressView *progressView = [[CircleProgressView alloc] init];
    progressView.frame = CGRectMake(50, 60, self.view.frame.size.width - 100, self.view.frame.size.width - 100);
    progressView.backgroundColor = [UIColor lightGrayColor];
    
#if 0
    progressView.progress = 0.2;
#endif
    
    [self.view addSubview:progressView];

#if 1
    //进度
    progressView.progress = 0.2;
#endif
    
    //CATextLayer
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        progessView.progessTintColor = [UIColor greenColor];
//    });
    
    _progressView = progressView;
    
//    NSLog(@"%f",progressView.progress);
//    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (void)update
{
    _progressView.progress += 0.01;
    
    if (_progressView.progress >= 1.0)
    {
        [_timer invalidate];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    NSLog(@"viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:YES];
    
    NSLog(@"viewDidAppear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
