//
//  BNLoadErrorView.m
//  03-BDNMProject
//
//  Created by vera on 16/7/20.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BNLoadErrorView.h"
#import "Masonry.h"

@interface BNLoadErrorView ()

@property (nonatomic, weak) UIImageView *errorImageView;
@property (nonatomic, weak) UIButton *refreshButton;

@end

@implementation BNLoadErrorView

#pragma mark - 懒加载
- (UIButton *)refreshButton
{
    if (!_refreshButton)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 10;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:@"点击刷新" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:btn];
        
        _refreshButton = btn;
    }
    
    return _refreshButton;
}

- (UIImageView *)errorImageView
{
    if (!_errorImageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fd_fgh_icon_nodate"]];
        [self addSubview:imageView];
        
        _errorImageView = imageView;
    }
    
    return _errorImageView;
}

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    [self.errorImageView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.width.and.height.mas_equalTo(80);
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-50);
    }];
    
    [self.refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.errorImageView.mas_bottom).offset(20);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
}

#pragma mark - 隐藏
/**
 *  隐藏
 */
+ (void)dismissInView:(UIView *)view
{
    for (UIView *subview in view.subviews)
    {
        if ([subview isKindOfClass:[BNLoadErrorView class]])
        {
            [subview removeFromSuperview];
        }
    }
}

#pragma mark - 显示
/**
 *  显示
 *
 *  @param view <#view description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)showInView:(UIView *)view dismiss:(LoadErrorViewDidDismissCallBack)dismiss
{
    BNLoadErrorView *loadErrorView = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    loadErrorView.loadErrorViewDidDismissCallBack = dismiss;
    [view addSubview:loadErrorView];
    
    return loadErrorView;
}

#pragma mark - setter方法
/**
 *  设置刷新回调
 *
 *  @param callback <#callback description#>
 */
- (void)setLoadErrorViewDidDismissCallBack:(LoadErrorViewDidDismissCallBack)callback
{
    _loadErrorViewDidDismissCallBack = callback;
}

#pragma mark - Event Handle
- (void)buttonClick:(UIButton *)button
{
    //1.移除当前视图
    [self removeFromSuperview];
    
    //2.回调
    if (_loadErrorViewDidDismissCallBack)
    {
        _loadErrorViewDidDismissCallBack();
    }
}

@end
