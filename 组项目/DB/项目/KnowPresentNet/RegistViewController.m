//
//  RegistViewController.m
//  KnowPresentNet
//
//  Created by mac on 16/7/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RegistViewController.h"
#import "LoginViewController.h"

@interface RegistViewController ()
{
    NSInteger _count;
}
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@end

@implementation RegistViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
       
        
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"注册";
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    
    self.navigationItem.leftBarButtonItem = btn;
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.loginBtn.layer.cornerRadius = 5.0;
    self.loginBtn.layer.masksToBounds = YES;
    
    self.registerBtn.layer.cornerRadius = 5.0;
    self.registerBtn.layer.masksToBounds = YES;
    
    self.codeBtn.layer.cornerRadius = 3.0;
    self.codeBtn.layer.masksToBounds = YES;
}

- (void)backAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//获取验证码
- (IBAction)GetvVerificationCode:(UIButton *)sender {
   
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.nameField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
    
            [self warningBoxString:@"发送验证码成功！"];
            
        }else{
            NSLog(@"error:%@",error);
            [self warningBoxString:@"发送验证码失败！"];
        }
    }];
    
}




//注册完成
- (IBAction)registerButton:(UIButton *)sender {
    
//校验验证码是否正确
#if 0
    [SMSSDK commitVerificationCode:self.messageField.text phoneNumber:self.nameField.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            [self warningBoxString:@"校验成功！"];
        }else{
            NSLog(@"error:%@",error);
            [self warningBoxString:@"验证码校验失败！"];
        }
    }];
#endif
    
    //点击注册按钮的反馈信息
    [self registerFeedback];
   
    
}
//点击注册按钮的反馈信息
- (void)registerFeedback
{
    if (self.nicknameField.text == nil || [self.nicknameField.text isEqualToString:@""]) {
        self.nicknameField.text = self.nameField.text;
    }
    
    
    [MyNetWorking postDataWithString:RegisterURL andParam:@{@"mobile":self.nameField.text,@"password":self.wordField.text,@"pincode":self.messageField.text,@"nickname":self.nicknameField.text} complicationBlock:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"%@", connectionError);
        } else {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            _count = [dict[@"status"] integerValue];
            [self warningBoxString:dict[@"data"]];
        }
    }];
}



//登录
- (IBAction)LoginButton:(UIButton *)sender {
    
    if (_count == 1 || _count == 2) {
        
        self.passBlock(self.nameField.text,self.wordField.text);
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    
}

//提示框
- (void)warningBoxString:(NSString *)string
{
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:string delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    
    [alertV show];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
