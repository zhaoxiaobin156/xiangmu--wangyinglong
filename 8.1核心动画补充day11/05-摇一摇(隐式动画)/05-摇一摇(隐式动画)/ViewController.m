//
//  ViewController.m
//  05-摇一摇(隐式动画)
//
//  Created by vera on 16/8/1.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
//导入
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置内容
    self.view.layer.contents = (id)[UIImage imageNamed:@"ShakeforsongBgshade"].CGImage;
}

/**
 *  当摇一瑶的时候会触发
 *
 *  @param motion <#motion description#>
 *  @param event  <#event description#>
 */
- (void)motionBegan:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event
{
    NSLog(@"摇一摇");
    
    /**
     *  隐式动画
     */
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.duration = 0.5;
    
    //动画结束的位移，相对于原来的位置
    animation.toValue = @(-25);
    
    animation.autoreverses = YES;
    
    [self.topImageView.layer addAnimation:animation forKey:nil];
    
    //向下移动
    animation.toValue = @(25);
    
    [self.bottomImageView.layer addAnimation:animation forKey:nil];
    
    //播放短音效
    //soundID
    SystemSoundID systemSoundID;
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"shake_sound_male.wav" ofType:nil]];
    
    //加载指定的短音效
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &systemSoundID);
    
    //播放指定的soundID
    AudioServicesPlaySystemSound(systemSoundID);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController:[[DetailViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  修改状态栏的样式，该方法自动调用
 *
 *  @return <#return value description#>
 */
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

@end
