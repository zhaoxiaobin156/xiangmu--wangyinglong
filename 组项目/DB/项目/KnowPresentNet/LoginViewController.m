//
//  LoginViewController.m
//  KnowPresentNet
//
//  Created by mac on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "LoginSuccessViewController.h"
#import "PrefixHeader.pch"

@interface LoginViewController ()
{
   
    BOOL _isEnter;//用户名与密码是否正确
    NSInteger _count;
   
}

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:242/255.0 blue:243/255.0 alpha:1];
    
    [self createView];
}

- (void)createView
{
    //用户名,密码
    NSArray *array =@[@"手机号:",@"密   码:"];
    for (int i=0; i<2; i++)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 142+i*60, 70, 30)];
        label.text = array[i];
        [self.view addSubview:label];
    }
    
    _nameField = [[UITextField alloc]initWithFrame:CGRectMake(90, 142, SCREEN_W-20-70-20, 30)];
    _nameField.placeholder = @"请输入所注册的手机号";
    _nameField.backgroundColor = [UIColor whiteColor];
    _nameField.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:_nameField];
    
    _wordField = [[UITextField alloc]initWithFrame:CGRectMake(90, 202, SCREEN_W-20-70-20, 30)];
    _wordField.placeholder = @"请输入6-12位密码";
    _wordField.backgroundColor = [UIColor whiteColor];
    _wordField.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:_wordField];
    _wordField.secureTextEntry = YES;
    
    
    UnderlineLabel *label1 = [[UnderlineLabel alloc] initWithFrame:CGRectMake(90, 245, 100, 15)];
    label1.underlineLineStyle = UnderlineLineStyleSingle;
    label1.underlineLineColor = [UIColor redColor];
    label1.text = @"忘记密码?";
    label1.textColor = [UIColor colorWithRed:244/255.0 green:106/255.0 blue:57/255.0 alpha:1];
    label1.font = [UIFont systemFontOfSize:12];
        
    
    [self.view addSubview:label1];
    
    
    
//    StrokeThoughtLineLabel *label2 = [[StrokeThoughtLineLabel alloc] initWithFrame:CGRectMake(200, 245, 100, 15)];
//    label2.strokeThoughtLineStyle = StrokeThoughtLineStyleSingle;
//    label2.strokeThoughtLineColor = [UIColor blackColor];
//    label2.text = @"忘记密码?";
//    label2.textColor = [UIColor colorWithRed:244/255.0 green:106/255.0 blue:57/255.0 alpha:1];
//    label2.font = [UIFont systemFontOfSize:15];
//    
//    
//    [self.view addSubview:label2];
    
    
    
    //登录
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(20, 300, (SCREEN_W-60)/2, 30);
    btn1.tag = 100;
    btn1.backgroundColor = [UIColor colorWithRed:254/255.0 green:120/255.0 blue:151/255.0 alpha:1];
    btn1.layer.cornerRadius = 5;
    [btn1 setTitle:@"登    录" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    //注册
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake((SCREEN_W-60)/2+40, 300, (SCREEN_W-60)/2, 30);
    btn2.tag = 101;
    btn2.backgroundColor = [UIColor colorWithRed:254/255.0 green:120/255.0 blue:151/255.0 alpha:1];
    btn2.layer.cornerRadius = 5;
    [btn2 setTitle:@"注    册" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn2 addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

//登录
- (void)btnClick1:(UIButton *)sender
{
    //登录请求
    [self judgmentAccountPassword];
#if 0 //帐号密码正确才能登录
    if (_count==1) {
        LoginSuccessViewController *StartPageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"loginSuccessVC"];
        
        
        [self.navigationController pushViewController:StartPageVC animated:YES];
    }
#endif
    
#if 1 //免帐号密码登录
    LoginSuccessViewController *StartPageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"loginSuccessVC"];
    
    
    [self.navigationController pushViewController:StartPageVC animated:YES];
  
#endif
    
}

//登录请求
- (void)judgmentAccountPassword
{
    [MyNetWorking postDataWithString:LoginURL andParam:@{@"mobile":self.nameField.text,@"password":self.wordField.text} complicationBlock:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"%@", connectionError);
        } else {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            self.dict = [[NSDictionary alloc] initWithDictionary:dict];
            
            AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
            
            app.dict = [[NSDictionary alloc] initWithDictionary:dict];
           
            _count = [dict[@"status"] integerValue];
            
            if (_count == 0) {
                [self warningBoxString:dict[@"data"]];
            }
            
            
        }
    }];
}


//注册
- (void)btnClick2:(UIButton *)sender
{
    RegistViewController *registerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"registVC"];
    
    registerVC.passBlock = ^void(NSString *string1,NSString *string2){
        
        self.nameField.text = string1;
        self.wordField.text = string2;
    };
    
    [self.navigationController pushViewController:registerVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//提示框
- (void)warningBoxString:(NSString *)string
{
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:string delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    
    [alertV show];
}

@end
