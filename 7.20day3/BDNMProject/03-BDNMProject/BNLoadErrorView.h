//
//  BNLoadErrorView.h
//  03-BDNMProject
//
//  Created by vera on 16/7/20.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LoadErrorViewDidDismissCallBack)(void);

@interface BNLoadErrorView : UIView

@property (nonatomic, copy) LoadErrorViewDidDismissCallBack loadErrorViewDidDismissCallBack;


/**
 *  显示
 *
 *  @param view <#view description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)showInView:(UIView *)view dismiss:(LoadErrorViewDidDismissCallBack)dismiss;

/**
 *  隐藏
 */
+ (void)dismissInView:(UIView *)view;

@end
