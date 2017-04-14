//
//  TestView.m
//  回调的其他写法Demo
//
//  Created by vera on 16/7/21.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "TestView.h"

@interface TestView ()
{
    id _target;
    SEL _sel;
    
    UIButton *_btn;
}

@end

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20, 20, 80, 40);
        [btn setTitle:@"点击" forState:0];
        [btn setBackgroundColor:[UIColor redColor]];
        [self addSubview:btn];
        
        _btn = btn;
    }
    return self;
}


- (void)addTarget:(id)target sel:(SEL)sel
{
    _target = target;
    _sel = sel;
    
    [_btn addTarget:_target action:_sel forControlEvents:UIControlEventTouchUpInside];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
