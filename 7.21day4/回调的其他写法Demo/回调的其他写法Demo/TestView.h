//
//  TestView.h
//  回调的其他写法Demo
//
//  Created by vera on 16/7/21.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void(^Callback)(void);

@interface TestView : UIView

//- (void)setCallback:(Callback)callcack;

//AOP:面向切面编程
//http://www.jianshu.com/p/21a82ea227de

- (void)addTarget:(id)target sel:(SEL)sel;

@end
