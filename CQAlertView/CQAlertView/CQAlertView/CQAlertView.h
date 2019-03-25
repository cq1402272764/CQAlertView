//
//  AlertView.h
//  AlertView
//
//  Created by CQ on 2018/11/29.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef UIView * _Nonnull (^ActionsView)(UIView * _Nonnull ActionsView);
typedef void (^CorrectButtonBlock)(UIButton * _Nonnull correctButton);
typedef void (^CancelButtonBlock)(UIButton * _Nonnull cancelButton);

@interface CQAlertView : UIViewController

@property(nonatomic, copy) CorrectButtonBlock _Nonnull correctBlock;

@property(nonatomic, copy) CancelButtonBlock _Nonnull cancelBlock;

/// 懒加载
+ (CQAlertView *_Nonnull)sharedInstance;

// 默认情况下的alert
- (void)alert:(UIViewController *_Nonnull)viewController alertContent:(NSString *_Nonnull)content correctBack:(CorrectButtonBlock _Nonnull )correct;

/**
 * 修改后的alert，需要显示的信息内容/信息视图
 * alertViewController : 需要监听的控制器
 */
- (void)alertWithTitle:(nullable NSString *)title
            cancelText:(nullable NSString *)cancelText
           correctText:(nullable NSString *)correctText
   alertViewController:(UIViewController *_Nonnull)viewController
           actionsView:(UIView *_Nonnull)actionsView
           correctBack:(CorrectButtonBlock _Nonnull )correct
            cancelBack:(CancelButtonBlock _Nonnull )cancel;

/// ------------所有颜色属性请先实现显示alert方法-----------------------------------------

/// 关闭alert
- (void)dismiss;

/// 设置内容文字颜色，默认是黑色
@property (nullable, nonatomic, strong) UIColor *centerLabelColor;

/// 取消按钮文字颜色，默认黑色
@property (nullable, nonatomic, strong) UIColor *cancelColor;

/// 正确按钮文字颜色，默认黑色backgroundColor
@property (nullable, nonatomic, strong) UIColor *correctColor;

/// 标题文字颜色，默认黑色
@property (nullable, nonatomic, strong) UIColor *titleColor;

/// 正确按钮的背景颜色，默认白色
@property (nullable, nonatomic, strong) UIColor *correctBackgroundColor;

/// 取消的背景颜色，默认白色
@property (nullable, nonatomic, strong) UIColor *cancelBackgroundColor;



@end
