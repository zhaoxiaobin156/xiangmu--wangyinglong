//
//  ViewController.m
//  02-单例(arc)
//
//  Created by vera on 16/8/12.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "Utiltiy.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Utiltiy *utility = [Utiltiy utility];
    [utility release];
    
    for (int i = 0; i < 10; i++)
    {
        static int s = 0;
        
        s++;
        
        NSLog(@"%d",s);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
