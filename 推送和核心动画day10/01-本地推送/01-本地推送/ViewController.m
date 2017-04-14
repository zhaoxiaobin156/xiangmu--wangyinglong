//
//  ViewController.m
//  01-本地推送
//
//  Created by vera on 16/7/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)buttonClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //远程推送和本地推送在iOS8开始，如果使用需要先授权
    
    //1.注册
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        //设置类型
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert  categories:nil];
        
        //注册类型
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
        //执行本地推送
//        [[UIApplication sharedApplication] scheduledLocalNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound |
            UIRemoteNotificationTypeAlert
         ];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  返回yyyy/MM/dd HH-mm-ss
 *
 *  @return <#return value description#>
 */
- (NSString *)dateFormatterWithDate:(NSDate *)date
{
    //1.时间格式化类
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //2.设置时间格式
    formatter.dateFormat = @"yyyy/MM/dd HH-mm-ss";
    
    return [formatter stringFromDate:date];
}

- (IBAction)buttonClick:(id)sender
{
    /**
     本地推送
     */
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    /*
     NSDate *date1;
     NSDate *date2;
     
     //两个时间的差，单位是秒
     [date1 timeIntervalSinceDate:date2];
     
     //一个小时后：
     [NSDate dateWithTimeIntervalSinceNow:60*60];
     */
    
    //1.执行时间,3秒后执行
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    
    //2.推送内容
    notification.alertBody = @"你生日🎂";
    
    //3.设置收到消息的提示声音
    notification.soundName = @"cash_received.caf";
    
    NSLog(@"%@",[self dateFormatterWithDate:notification.fireDate]);
    
    //用户信息，目的主要能够找到指定的推送
    notification.userInfo = @{@"LocalNotificationKey": [NSString stringWithFormat:@"%@",[self dateFormatterWithDate:notification.fireDate]]};
    
    //每隔多久重复一次
    /*
     NSCalendarUnitDay 每天一次
     */
//    notification.repeatInterval = NSCalendarUnitDay;
    
    //4.执行推送
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

/**
 *  取消指定推送
 */
- (void)cancelLocalNotification:(UILocalNotification *)localNotification
{
    //1.获取所有的本地推送
    NSArray *allNotification = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    //2.获取要取消的推送的标识
    NSString *identifier = localNotification.userInfo[@"LocalNotificationKey"];
    
    //3.遍历查找要的取消的推送
    for (UILocalNotification *notification in allNotification)
    {
        if ([notification.userInfo[@"LocalNotificationKey"] isEqualToString:identifier])
        {
            //取消指定本地推送
            [[UIApplication sharedApplication] cancelLocalNotification:notification];
            
            //取消所有本地推送
//            [[UIApplication sharedApplication] cancelAllLocalNotifications];
            
            break;
        }
    }
}
                                                        
@end
