//
//  ViewController.m
//  testDemo
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "Person.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  
    
    //发送网络请求
    
    //请求完成回调
    
    //解析封装模型
    
    //刷新tableView
    
//    UITableView *tableView;
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
//    [tableView indexPathForCell:cell];
    
    
    NSObject *object = [[[NSObject alloc] init] autorelease];
    
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [array addObject:@"sss"];
    
    [array addObject:@"222"];
    
    
    
    __strong NSMutableArray *arr1 = [[self array] retain];
    
#if 0
    
    //person:1
    Person *person = [[Person alloc] init];
    //person:1 dog:1
    Dog *dog = [[Dog alloc] init];
    
    //person:1 dog:2
    person.dog = dog;
    
    //person:1 dog:1
    [dog release];
    
    //person:0 dog:0
    [person release];
    
    
    //1
    Person *p = [[[Person alloc] init] autorelease];
    //2
    [p retain];
    //3
    [p retain];
    //2
    [p release];
    //2
    [p autorelease];
#endif
    
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    Person *person = [[Person alloc] init];
    person.array = arr;
    
    [arr release];
    
    


    
    
    
   
    
    
}

- (NSMutableArray *)array
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    return  [array autorelease];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
