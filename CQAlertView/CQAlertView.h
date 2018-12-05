//
//  AlertView.h
//  AlertView
//
//  Created by CQ on 2018/11/29.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView * (^ActionsView)(void);
typedef void (^CorrectButtonBlock)(UIButton *correctButton);
typedef void (^CancalButtonBlock)(UIButton *cancalButton);


@interface CQAlertView : UIViewController

@property(nonatomic, copy) CorrectButtonBlock correctBlock;

@property(nonatomic, copy) CancalButtonBlock cancalBlock;

/**
 * 需要显示的信息内容/信息视图，默认是tableView
 * messageHeight:设置alert消息内容的高度
 * actionsView可以不用设置frame，只设置messageHeight高度即可
 */
- (void)alertWithTitle:(nullable NSString *)title
            cancelText:(nullable NSString *)cancelText
           correctText:(nullable NSString *)correctText
         showAlertView:(UIViewController *)viewController
         messageHeight:(CGFloat)height
           actionsView:(ActionsView)actionsView
           correctBack:(CorrectButtonBlock)correct
            cancalBack:(CancalButtonBlock)cancal;

/// 关闭alert
- (void)dismiss;

/// 取消按钮文字颜色，默认黑色 , 注：所有颜色属性请先设置 alertWithTitle:cancelText:correctText:showAlertView:messageHeight:actionsView:correctBack:cancalBack: 方法，才可以设置成功
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
