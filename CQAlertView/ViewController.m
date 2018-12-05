//
//  ViewController.m
//  CQAlertView
//
//  Created by CQ on 2018/12/4.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "ViewController.h"
#import "CQAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CQAlertView *alert = [[CQAlertView alloc] init];
    [alert alertWithTitle:@"提示" cancelText:nil correctText:nil showAlertView:self messageHeight:200 actionsView:^UIView * {
        UITableView *view = [[UITableView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    } correctBack:^(UIButton *correctButton) {
        NSLog(@"正确");
        [alert dismiss];
    } cancalBack:^(UIButton *cancalButton) {
        NSLog(@"取消");
    }];
    alert.titleColor = [UIColor greenColor];
}


@end
