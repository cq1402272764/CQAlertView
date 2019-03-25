//
//  ViewController.m
//  CQAlertView
//
//  Created by CQ on 2019/3/25.
//  Copyright © 2019年 CQ. All rights reserved.
//

#import "ViewController.h"
#import "CQAlertView.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self alertView1];
}

- (void)alertView{
    CQAlertView *alert = [[CQAlertView alloc] init];
    __weak typeof(alert) weakAlert = alert;
    [alert alert:self alertContent:@"内容内容内容内容内容内容" correctBack:^(UIButton * _Nonnull correctButton) {
        NSLog(@"正确");
        [weakAlert dismiss];
    }];
    alert.centerLabelColor = [UIColor grayColor];
}

- (void)alertView1{
    CQAlertView *alert = [[CQAlertView alloc] init];
    UITableView *table = [[UITableView alloc] init];
    table.dataSource = self;
    table.frame = CGRectMake(0, 0, 100, self.view.bounds.size.height - 200);
    
    [alert alertWithTitle:@"提示" cancelText:@"" correctText:@"" alertViewController:self actionsView:table correctBack:^(UIButton * _Nonnull correctButton) {
        NSLog(@"正确");
    } cancelBack:^(UIButton * _Nonnull cancelButton) {
        NSLog(@"取消");
    }];
    alert.correctColor = [UIColor redColor];
    alert.cancelColor = [UIColor redColor];
    alert.titleColor = [UIColor greenColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"table";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}



@end
