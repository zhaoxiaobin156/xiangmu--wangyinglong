//
//  TacticViewController.m
//  KnowPresentNet
//
//  Created by mac on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TacticViewController.h"
#import "TacticModel.h"
#import "TacticCollectionViewCell.h"

@interface TacticViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *whiteSlider;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property(nonatomic,strong)UIView *redSlider;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,strong)NSMutableArray *dataSource;

@property(nonatomic,strong)NSArray *catArr;

@property(nonatomic,strong)NSArray *typeArr;

@property(nonatomic,strong)NSArray *tagArr;

@end

@implementation TacticViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        UIImage *currentImage = [UIImage reSizeImage:[UIImage imageNamed:@"tab_icon_grey_qingligonglve"] toSize:CGSizeMake(30, 30)];
        
        UIImage *selectedImage=[UIImage reSizeImage:[UIImage imageNamed:@"tab_icon_red_qingligonglve"] toSize:CGSizeMake(30, 30)];
        
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"情礼攻略" image:currentImage selectedImage:selectedImage];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    [self createBtn];
    [self getData];
}

/** 左边栏目按钮响应事件 */
- (IBAction)leftBtn:(UIButton *)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        
         self.whiteSlider.frame = CGRectMake(110, 37, 60, 2);
        
    }];
}

/** 右边栏目按钮响应事件 */
- (IBAction)rightBtn:(UIButton *)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.whiteSlider.frame = CGRectMake(SCREEN_W - 170, 37, 60, 2);
        
    }];
}

/** 创建标签按钮 */
-(void)createBtn{

    NSArray *titleArr = @[@"全部",@"求婚",@"告白",@"探亲",@"乔迁",@"会友",@"商务",@"致谢",@"道歉",@""];
    
    for (int i = 0; i < 10; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20 + (SCREEN_W - 20) / 10 * i, 5, (SCREEN_W - 20) / 10, 20);
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        
        if (i == 0) {
            
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        
        if (i == 9) {
            
            [btn setBackgroundImage:[UIImage imageNamed:@"icon_more_red"] forState:UIControlStateNormal];
        }
        
        btn.tag = 100 + i;
        
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.scrollView addSubview:btn];
    }
    
    self.redSlider = [[UIView alloc] initWithFrame:CGRectMake(20, 26, (SCREEN_W - 20) / 10, 2)];
    self.redSlider.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:self.redSlider];
}

/** 标签按钮响应事件 */
-(void)clickBtn:(UIButton *)button{

    for (int i = 0; i < 10; i++) {
        
        UIButton *btn = (UIButton *)[self.view viewWithTag:100 + i];
        
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    if (button.tag != 109) {
        
        self.redSlider.frame = CGRectMake(20 + (SCREEN_W - 20) / 10 * (button.tag - 100), 26, (SCREEN_W - 20) / 10, 2);
    }
}

/** 懒加载 */
-(NSMutableArray *)dataSource{

    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

/** 获取用户登录令牌 */
-(NSString *)getToken{

    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSLog(@"dict = %@",app.dict);
    
    return app.dict[@"token"];
}

/** 请求数据 */
-(void)getData{
    
    [MyNetWorking postDataWithString:LoveGiftURL andParam:nil complicationBlock:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError) {
            
            NSLog(@"错误信息 ＝ %@",connectionError);
            
        }else{
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSArray *arr = dic[@"idealist"];
            
            for (NSDictionary *dic in arr) {
                
                TacticModel *mod = [[TacticModel alloc] initWithDictionary:dic error:nil];
                
                [self.dataSource addObject:mod];
            }
            
            [self.collectionView reloadData];
        }
        
    }];
}

#pragma mark --- UICollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TacticCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TacticCollectionViewCell" forIndexPath:indexPath];
    
    cell.tacticView.dataSource = self.dataSource;
    
    return cell;
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
