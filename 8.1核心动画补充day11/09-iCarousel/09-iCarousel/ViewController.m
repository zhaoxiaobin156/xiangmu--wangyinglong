//
//  ViewController.m
//  09-iCarousel
//
//  Created by vera on 16/8/1.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "iCarousel.h"

@interface ViewController ()<iCarouselDelegate, iCarouselDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    iCarousel *carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 500)];
    carousel.delegate = self;
    carousel.dataSource = self;
    
    /*
     iCarouselTypeLinear = 0,
     iCarouselTypeRotary,
     iCarouselTypeInvertedRotary,
     iCarouselTypeCylinder,
     iCarouselTypeInvertedCylinder,
     iCarouselTypeWheel,
     iCarouselTypeInvertedWheel,
     iCarouselTypeCoverFlow,
     iCarouselTypeCoverFlow2,
     iCarouselTypeTimeMachine,
     iCarouselTypeInvertedTimeMachine,
     */
    //3D类型
    carousel.type = iCarouselTypeCylinder;
    
    //视角的偏移
//    carousel.viewpointOffset = CGSizeMake(100, 300);
    
    //自动滚动
    carousel.autoscroll = YES;
    
    [self.view addSubview:carousel];
}

#pragma mark - iCarouselDelegate

/**
 *  返回个数
 *
 *  @param carousel <#carousel description#>
 *
 *  @return <#return value description#>
 */
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 100;
}

/**
 *  <#Description#>
 *
 *  @param carousel <#carousel description#>
 *  @param index    <#index description#>
 *  @param view     <#view description#>
 *
 *  @return <#return value description#>
 */
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIImageView *)view
{
    if (!view)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, carousel.frame.size.width - 100, 400)];
    }
    
    NSString *imageName = [NSString stringWithFormat:@"Irelia_%ld",index%6];
    
    view.image = [UIImage imageNamed:imageName];
    
    return view;
}

/**
 *  选择了某个item
 *
 *  @param carousel <#carousel description#>
 *  @param index    <#index description#>
 */
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSString *message = [NSString stringWithFormat:@"点击了%ld个",index];
    
    [[[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
