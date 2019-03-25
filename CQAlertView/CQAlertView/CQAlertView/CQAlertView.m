//
//  AlertView.m
//  AlertView
//
//  Created by CQ on 2018/11/29.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "CQAlertView.h"

#define kFBaseHeight [[UIScreen mainScreen]bounds].size.height
#define kFBaseWidth [[UIScreen mainScreen]bounds].size.width

@interface CQAlertView ()
@property (strong, nonatomic) UIView *backView;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIView *centerView;
@property (strong, nonatomic) UILabel *centerLabel;
@property (strong, nonatomic) UIView *footerView;
@property (strong, nonatomic) UIButton *cancelBtn;
@property (strong, nonatomic) UIButton *correctBtn;
@property (strong, nonatomic) UIButton *cancelBadgeBtn;
@property (strong, nonatomic) UIButton *correctBadgeBtn;
@property (strong, nonatomic) UILabel *titleLabel;
@property (assign, nonatomic) CGFloat titleLabelH;
@end

@implementation CQAlertView

static CGFloat backViewX = 20;
static CGFloat backViewY = 100;
static CGFloat lineH = 0.5;
static CGFloat footHeaderViewH = 50;

- (CGFloat)backBaseWidth{
    return kFBaseWidth-backViewX*2;
}

- (CGFloat)backBaseHeight{
    return kFBaseHeight-backViewY*2;
}

- (UIColor *)buttonColor{
    return [UIColor colorWithRed:21/255.0 green:120/255.0 blue:236/255.0 alpha:1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
}

- (UIView *)backView{
    if (!_backView) {
        UIView *backView = [[UIView alloc] init];
        backView.translatesAutoresizingMaskIntoConstraints = NO;
        backView.layer.cornerRadius = 10;
        backView.layer.masksToBounds = YES;
        backView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:backView];
        self.backView = backView;
    }
    return _backView;
}

- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.backView addSubview:_headerView];
    }
    return _headerView;
}

- (UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc] init];
        _footerView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.backView addSubview:_footerView];
    }
    return _footerView;
}

- (UIView *)centerView{
    if (!_centerView) {
        _centerView = [[UIView alloc] init];
        _centerView.translatesAutoresizingMaskIntoConstraints = NO;
        _centerView.backgroundColor = [UIColor redColor];
        [self.backView addSubview:_centerView];
    }
    return _centerView;
}

- (UILabel *)centerLabel{
    if (!_centerLabel) {
        _centerLabel = [[UILabel alloc] init];
        _centerLabel.font = [UIFont systemFontOfSize:16];
        _centerLabel.numberOfLines = 0;
        _centerLabel.textAlignment = NSTextAlignmentCenter;
        _centerLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.centerView addSubview:_centerLabel];
    }
    return _centerLabel;
}

- (UIButton *)correctBadgeBtn{
    if (!_correctBadgeBtn) {
        _correctBadgeBtn = [[UIButton alloc] init];
        _correctBadgeBtn.frame = CGRectMake(1, 1, 20, 20);
        _correctBadgeBtn.layer.cornerRadius = 10;
        _correctBadgeBtn.backgroundColor = [UIColor redColor];
    }
    return _correctBadgeBtn;
}

- (UIButton *)cancelBadgeBtn{
    if (!_cancelBadgeBtn) {
        _cancelBadgeBtn = [[UIButton alloc] init];
        [self.cancelBtn addSubview:_cancelBadgeBtn];
    }
    return _cancelBadgeBtn;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.headerView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] init];
        _cancelBtn.translatesAutoresizingMaskIntoConstraints = NO;
        _cancelBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [self.footerView addSubview:_cancelBtn];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self backBaseWidth], lineH)];
        line.backgroundColor = [UIColor grayColor];
        [_cancelBtn addSubview:line];
    }
    return _cancelBtn;
}

- (UIButton *)correctBtn{
    if (!_correctBtn) {
        _correctBtn = [[UIButton alloc] init];
        _correctBtn.translatesAutoresizingMaskIntoConstraints = NO;
        _correctBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [self.footerView addSubview:_correctBtn];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self backBaseWidth], lineH)];
        line.backgroundColor = [UIColor grayColor];
        [_correctBtn addSubview:line];
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, lineH, footHeaderViewH)];
        line1.backgroundColor = [UIColor grayColor];
        [_correctBtn addSubview:line1];
    }
    return _correctBtn;
}

- (void)addCorrectBlock:(CorrectButtonBlock)block{
    if (block){
        _correctBlock = block;
        [self.correctBtn addTarget:self action:@selector(correctButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)addCancelBlock:(CancelButtonBlock)block{
    if (block){
        _cancelBlock = block;
        [self.cancelBtn addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)correctButtonAction:(UIButton *)button{
    _correctBlock(button);
}

- (void)cancelButtonAction:(UIButton *)button{
    _cancelBlock(button);
    [self dismiss];
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

+ (CQAlertView *)sharedInstance{
    static CQAlertView *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[CQAlertView alloc] init];
    });
    return sharedManager;
}

- (void)showAlertView:(UIViewController *)viewController{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
    nav.navigationBarHidden = YES;
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [viewController presentViewController:nav animated:YES completion:nil];
}

+ (void)alert:(UIViewController *)viewController alertContent:(NSString *)content correctBack:(CorrectButtonBlock)correct{
    dispatch_async(dispatch_get_main_queue(), ^{
        CQAlertView *alert = [CQAlertView sharedInstance];
        [alert showAlertView:viewController];
        [alert actionsView:nil messageHeight:0 title:@"提示"];
        [alert setAlertViewAttributeWithTitle:nil cancelText:nil correctText:nil];
        alert.centerLabel.text = content;
        if (correct) [alert addCorrectBlock:correct];
        __weak typeof(alert) weakAlert = alert;
        [alert addCancelBlock:^(UIButton * _Nonnull cancelButton) {
            [weakAlert dismiss];
        }];
    });
}

+ (void)alertWithTitle:(NSString *)title cancelText:(NSString *)cancelText correctText:(NSString *)correctText alertViewController:(UIViewController *)viewController actionsView:(UIView *)actionsView correctBack:(CorrectButtonBlock)correct cancelBack:(CancelButtonBlock)cancel{
    dispatch_async(dispatch_get_main_queue(), ^{
        CQAlertView *alert = [CQAlertView sharedInstance];
        [alert showAlertView:viewController];
        NSLog(@"-----%f",actionsView.bounds.size.height);
        [alert actionsView:actionsView messageHeight:actionsView.bounds.size.height title:title];
        [alert setAlertViewAttributeWithTitle:title cancelText:cancelText correctText:correctText];
        if (correct) [alert addCorrectBlock:correct];
        if (cancel) [alert addCancelBlock:cancel];
    });
}

- (void)actionsView:(UIView *)actionsView messageHeight:(CGFloat)height title:(NSString *)title{
    if (actionsView!=nil) {
        [self.centerView addSubview:actionsView];
        actionsView.frame = CGRectMake(0, 0, [self backBaseWidth], height);
    }
    if (title.length <=0) {
        [self setAlertViewLayoutWithShowHeader:NO showLabel:actionsView==nil ? YES : NO MessageHeight:height];
    }else{
        self.titleLabel.text = title;
        [self setAlertViewLayoutWithShowHeader:YES showLabel:actionsView==nil ? YES : NO MessageHeight:height];
    }
}

- (void)setAlertViewLayoutWithShowHeader:(BOOL)showHeader showLabel:(BOOL)showLabel MessageHeight:(NSInteger)messageHeight{
    CGFloat centerY;

    centerY = showHeader ? footHeaderViewH : 0;
    self.headerView.hidden = !showHeader;
    CGFloat centerViewH = messageHeight<1?80:messageHeight>kFBaseHeight-100?kFBaseHeight-100:messageHeight;
    CGFloat backViewH = footHeaderViewH+centerY+centerViewH;
    
    [self setCenterSuperView:self.view subview:self.backView attr:NSLayoutAttributeCenterX];
    [self setCenterSuperView:self.view subview:self.backView attr:NSLayoutAttributeCenterY];
    [self setMarginSuperView:self.view subview:self.backView attr:NSLayoutAttributeLeft constant:backViewX];
    [self setMarginSuperView:self.view subview:self.backView attr:NSLayoutAttributeRight constant:backViewX];
    [self setOwnSuperView:self.view View:self.backView attr:NSLayoutAttributeHeight constant:backViewH];
    
    [self setMarginSuperView:self.backView subview:self.headerView attr:NSLayoutAttributeLeft constant:0];
    [self setMarginSuperView:self.backView subview:self.headerView attr:NSLayoutAttributeTop constant:0];
    [self setMarginSuperView:self.backView subview:self.headerView attr:NSLayoutAttributeRight constant:0];
    [self setOwnSuperView:self.backView View:self.headerView attr:NSLayoutAttributeHeight constant:footHeaderViewH];

    [self setMarginSuperView:self.backView subview:self.footerView attr:NSLayoutAttributeLeft constant:0];
    [self setMarginSuperView:self.backView subview:self.footerView attr:NSLayoutAttributeRight constant:0];
    [self setMarginSuperView:self.backView subview:self.footerView attr:NSLayoutAttributeBottom constant:0];
    [self setOwnSuperView:self.backView View:self.footerView attr:NSLayoutAttributeHeight constant:footHeaderViewH];
    
    [self setMarginSuperView:self.backView subview:self.centerView attr:NSLayoutAttributeLeft constant:0];
    [self setMarginSuperView:self.backView subview:self.centerView attr:NSLayoutAttributeRight constant:0];
    [self setMarginSuperView:self.backView subview:self.centerView attr:NSLayoutAttributeTop constant:centerY];
    [self setOwnSuperView:self.backView View:self.centerView attr:NSLayoutAttributeHeight constant:centerViewH];
    if (showLabel) {
        [self setMarginSuperView:self.backView subview:self.centerLabel attr:NSLayoutAttributeLeft constant:10];
        [self setMarginSuperView:self.backView subview:self.centerLabel attr:NSLayoutAttributeRight constant:10];
        [self setMarginSuperView:self.backView subview:self.centerLabel attr:NSLayoutAttributeTop constant:centerY];
        [self setOwnSuperView:self.backView View:self.centerLabel attr:NSLayoutAttributeHeight constant:centerViewH];
    }
    [self setMarginSuperView:self.headerView subview:self.titleLabel attr:NSLayoutAttributeLeft constant:0];
    [self setMarginSuperView:self.headerView subview:self.titleLabel attr:NSLayoutAttributeRight constant:0];
    [self setMarginSuperView:self.headerView subview:self.titleLabel attr:NSLayoutAttributeTop constant:0];
    [self setMarginSuperView:self.headerView subview:self.titleLabel attr:NSLayoutAttributeBottom constant:lineH];
    
    [self setMarginSuperView:self.footerView subview:self.cancelBtn attr:NSLayoutAttributeLeft constant:0];
    [self setMarginSuperView:self.footerView subview:self.cancelBtn attr:NSLayoutAttributeBottom constant:0];
    [self setMarginSuperView:self.footerView subview:self.cancelBtn attr:NSLayoutAttributeTop constant:lineH];
    [self setMultiplierWidthSuperView:self.footerView View:self.cancelBtn multiplier:lineH];
    
    [self setMarginSuperView:self.footerView subview:self.correctBtn attr:NSLayoutAttributeRight constant:0];
    [self setMarginSuperView:self.footerView subview:self.correctBtn attr:NSLayoutAttributeBottom constant:0];
    [self setMarginSuperView:self.footerView subview:self.correctBtn attr:NSLayoutAttributeTop constant:lineH];
    [self setMultiplierWidthSuperView:self.footerView View:self.correctBtn multiplier:lineH];
}

- (void)setAlertViewAttributeWithTitle:(nullable NSString *)title cancelText:(nullable NSString *)cancelText correctText:(nullable NSString *)correctText{
    self.titleLabel.textColor = [UIColor blackColor];
    [self.correctBtn setTitleColor:[self buttonColor] forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[self buttonColor] forState:UIControlStateNormal];
    [self.correctBtn setTitle:correctText.length != 0?correctText:@"正确" forState:UIControlStateNormal];
    [self.cancelBtn setTitle:cancelText.length != 0?cancelText:@"取消" forState:UIControlStateNormal];
}

- (void)setCancelColor:(UIColor *)cancelColor{
    [self.cancelBtn setTitleColor:cancelColor==nil?[self buttonColor]:cancelColor forState:UIControlStateNormal];
}

- (void)setcorrectColor:(UIColor *)correctColor{
    [self.cancelBtn setTitleColor:correctColor==nil?[self buttonColor]:correctColor forState:UIControlStateNormal];
}

- (void)setTitleColor:(UIColor *)titleColor{
    self.titleLabel.textColor = titleColor==nil?[UIColor blackColor]:titleColor;
}

- (void)setcorrectBackgroundColor:(UIColor *)correctBackgroundColor{
    self.correctBtn.backgroundColor = correctBackgroundColor==nil?[UIColor whiteColor]:correctBackgroundColor;
}

- (void)setCancelBackgroundColor:(UIColor *)cancelBackgroundColor{
    self.cancelBtn.backgroundColor = cancelBackgroundColor==nil?[UIColor whiteColor]:cancelBackgroundColor;
}

- (void)setCenterSuperView:(UIView*)superview subview:(UIView*)subview attr:(NSLayoutAttribute)attr{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:attr relatedBy:NSLayoutRelationEqual toItem:superview attribute:attr multiplier:1.0 constant:0.0]];
}

- (void)setMarginSuperView:(UIView*)superview subview:(UIView*)subview attr:(NSLayoutAttribute)attr constant:(CGFloat)constant{
    CGFloat margin;
    if (attr == NSLayoutAttributeBottom || attr == NSLayoutAttributeRight) {
        margin = -constant;
    }else{
        margin = constant;
    }
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:attr relatedBy:NSLayoutRelationEqual toItem:superview attribute:attr multiplier:1.0 constant:margin]];
}

- (void)setOwnSuperView:(UIView*)superview View:(UIView*)view attr:(NSLayoutAttribute)attr constant:(CGFloat)constant{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:attr relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0 constant:constant]];
}

- (void)setMultiplierWidthSuperView:(UIView*)superview View:(UIView*)view multiplier:(CGFloat)multiplier{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:superview attribute:NSLayoutAttributeWidth
                                                         multiplier:multiplier constant:0]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"====");
}


@end
