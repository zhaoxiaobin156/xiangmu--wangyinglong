//
//  CareScrollerViewController.m
//  KnowPresentNet
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CareScrollerViewController.h"
#import "CaresubjectViewController.h"
@interface CareScrollerViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *backView; //!< 底部视图控制器
@property(nonatomic,strong)UIView *lineView; //!< 下划线
@property(nonatomic,strong)CaresubjectViewController *CVC;

@end

@implementation CareScrollerViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavigation];
    
    [self creatScrollView];
}


-(void)initNavigation
{
    
    UIView  *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    //    titleView.backgroundColor = [UIColor blueColor];
    self.navigationItem.titleView = titleView;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(0, 0, 65, 20);
    [btn1 setTitle:@"近期话题" forState:UIControlStateNormal];
    [btn1 setTintColor:[UIColor whiteColor]];
    [btn1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(85, 0, 65, 20);
    [btn2 setTitle:@"精品关怀" forState:UIControlStateNormal];
    [btn2 setTintColor:[UIColor whiteColor]];
    [btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:btn2];
    
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 25, 65, 5)];
    self.lineView.backgroundColor = [UIColor whiteColor];
    [titleView addSubview:self.lineView];
    
}

-(void)btn1Click:(UIButton *)btn
{
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.lineView.frame = CGRectMake(0, 25, 65, 5);
        
    }];
    
}

-(void)btn2Click:(UIButton *)btn
{
    [UIView animateWithDuration:0.2 animations:^{
        
        self.lineView.frame = CGRectMake(85, 25, 65, 5);
        
    }];
}



-(void)creatScrollView
{
    
    self.backView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    
    for (int i= 0; i<2; i++) {
        
        self.CVC = [[CaresubjectViewController alloc]init];
        self.CVC.view.frame = CGRectMake(i*SCREEN_W, 0, SCREEN_W, SCREEN_H);
        [self.backView addSubview:self.CVC.view];
        [self addChildViewController:self.CVC];
        
        [_CVC getDataFromNet:i+1];
        
    }
    
    self.backView.backgroundColor = [UIColor redColor];
    self.backView.contentSize = CGSizeMake(SCREEN_W * 2,0);
    self.backView.pagingEnabled = YES;
    self.backView.bounces = NO;
    self.backView.delegate = self;
    self.backView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.backView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
