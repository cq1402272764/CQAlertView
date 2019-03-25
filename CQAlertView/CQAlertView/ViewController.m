//
//  ViewController.m
//  CQAlertView
//
//  Created by CQ on 2019/3/21.
//  Copyright © 2019年 CQ. All rights reserved.
//

#import "ViewController.h"
#import "CQAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CQAlertView *alert = [CQAlertView sharedInstance];
//    [CQAlertView alert:self alertContent:@"内容" correctBack:^(UIButton * _Nonnull correctButton) {
//        NSLog(@"正确");
//        [alert dismiss];
//    }];
    
    UITableView *table = [[UITableView alloc] init];
    table.frame = CGRectMake(0, 0, 100, 500);
    [CQAlertView alertWithTitle:@"" cancelText:@"" correctText:@"" alertViewController:self actionsView:table correctBack:^(UIButton * _Nonnull correctButton) {
        NSLog(@"==");
    } cancelBack:^(UIButton * _Nonnull cancelButton) {
        NSLog(@"");
    }];
    alert.cancelColor = [UIColor redColor];
    
    NSLog(@"===11");
}


@end
