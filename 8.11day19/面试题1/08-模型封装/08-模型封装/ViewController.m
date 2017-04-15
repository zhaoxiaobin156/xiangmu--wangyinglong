//
//  ViewController.m
//  08-模型封装
//
//  Created by vera on 16/1/9.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+Model.h"
#import "NSObject+Property.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSDictionary -- > Model

    
    
    NSDictionary *dic = @{@"name":@"xiaoming",
                          @"age" : @(20),
                          @"address" : @"深圳市",
                          @"test" : @{@"name":@"test"}
                          };
    
    Person *xiaoming = [Person objectWithDictionary:dic];
    
    NSLog(@"%@",xiaoming);
    
    
//    NSLog(@"%@",[Person properties]);
    
#if 0
    {
        "name": "xiaoqiang",
        "age": 20,
        "address" : "深圳市"
    }
#endif
    
    NSString *jsonString = @"{\"name\": \"xiaoqiang\",\"age\": 20,\"address\" : \"深圳市\"}";
    
    Person *xiaoqiang = [Person objectWithJsonString:jsonString];
    
    NSLog(@"%@",xiaoqiang);
    
    //Model --->  NSDictionary;
    //嵌套
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
