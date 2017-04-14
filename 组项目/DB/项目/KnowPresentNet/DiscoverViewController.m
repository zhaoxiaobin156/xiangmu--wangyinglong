//
//  DiscoverViewController.m
//  KnowPresentNet
//
//  Created by mac on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DiscoverViewController.h"
#import "PhotographViewController.h"
#import "RemindpresentViewController.h"
#import "MessageViewController.h"
#import "SweepmoreViewController.h"
#import "MinecardViewController.h"
#import "CareScrollerViewController.h"

@interface DiscoverViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *myTableView;

@property(nonatomic,strong)NSMutableArray *mutArr;

@property(nonatomic,strong)NSMutableArray *imageArr;

@end

@implementation DiscoverViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc]init];
        self.tabBarItem.title = @"发现";
        [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        
        self.tabBarItem.image = [UIImage reSizeImage:[UIImage imageNamed:@"tab_icon_grey_faxian"] toSize:CGSizeMake(30, 30)];
        //设置选中时的图标
        UIImage *selectedImage=[UIImage reSizeImage:[UIImage imageNamed:@"tab_icon_red_faxian"] toSize:CGSizeMake(30, 30)];
        
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.selectedImage = selectedImage;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavigation];
    [self creatUI];
    [self creatData];
}

-(void)initNavigation
{
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"banner"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.title = @"发 现";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
}


-(void)creatUI
{
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    [self.view addSubview:self.myTableView];
    
}

-(void)creatData
{
    
    self.mutArr = [[NSMutableArray alloc]initWithArray:@[@"相册",@"情礼提醒",@"短信模版",@"扫一扫",@"我的卡劵",@"关怀话题"]];
    
    UIImage *duanxinImage = [UIImage reSizeImage:[UIImage imageNamed:@"list_icon_duanxinmoban@2x"] toSize:CGSizeMake(50, 50)];
    
    UIImage *wodekaquanImage =[UIImage reSizeImage:[UIImage imageNamed:@"list_icon_wodekaquan@2x"] toSize:CGSizeMake(50, 50)];
    
    self.imageArr = [NSMutableArray arrayWithArray:@[@"list_icon_xiangce@3x",@"list_icon_qinglitixing@3x",duanxinImage,@"list_icon_saoyisao@3x",wodekaquanImage,@"list_icon_guanhuaihuati@3x"]];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mutArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseID];
    }
    
    cell.textLabel.text = self.mutArr[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArr[indexPath.row]]];
    
    if (indexPath.row==2) {
        cell.imageView.image = self.imageArr[2];
    }
    if (indexPath.row==4) {
        cell.imageView.image = self.imageArr[4];
    }
    
    
    //设置辅助按钮；
    
    
    //    UITableViewCellAccessoryNone,  默认没有
    //    UITableViewCellAccessoryDisclosureIndicator, 箭头
    //    UITableViewCellAccessoryDetailDisclosureButton, 信息按钮+箭头
    //    UITableViewCellAccessoryCheckmark,  打钩
    //    UITableViewCellAccessoryDetailButton 信息按钮
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


//选中某一行；
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    PhotographViewController *pvc = [[PhotographViewController alloc]init];
    RemindpresentViewController *rvc = [[RemindpresentViewController alloc]init];
    MessageViewController *mvc =[[MessageViewController alloc]init];
    SweepmoreViewController *svc = [[SweepmoreViewController alloc]init];
    MinecardViewController *mcvc = [[MinecardViewController alloc]init];
    CareScrollerViewController *csvc = [[CareScrollerViewController alloc]init];
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:pvc animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:rvc animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:mvc animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:svc animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:mcvc animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController:csvc animated:YES];
            break;
        default:
            break;
    }
    
    
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
