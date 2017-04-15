//
//  ViewController.m
//  testDemo
//
//  Created by vera on 16/8/12.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, retain)NSString *name;

@property(nonatomic, copy)NSString *name2;

@end

@implementation ViewController

- (void)setName:(NSString *)name
{
    if (_name != name)
    {
        [_name release];
        
        _name = [name retain];
    }
}

- (void)setName2:(NSString *)name2
{
    if (_name2 != name2)
    {
        [_name2 release];
        
        _name2 = [name2 copy];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //注意：该Demo在MRC环境下
    
    NSString *urlString = @"http://www.baidu.com";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    request.HTTPMethod = @"HEAD";
    
    //设置请求头
    //[request setValue:@"bytes=200-" forHTTPHeaderField:@"Range"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        //所有的响应头信息
        NSDictionary *dic = httpResponse.allHeaderFields;
        
        NSLog(@"%@",dic);
        
        
        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:4]);
    }];
    
    [task resume];
    
    //ARC的自动释放池写法
    @autoreleasepool {
        
    }
    
#if 0
    //MRC的自动释放池写法
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    for (long i = 0; i < 10000000; i++)
    {
        NSLog(@"------");
        
        //每次循环1000次就对自动释放吃进行release
        if (i % 1000 == 0)
        {
            [pool release];
            pool = [[NSAutoreleasePool alloc] init];
        }
        
        NSMutableArray *array = [NSMutableArray array];
    }
    
    [pool release];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
