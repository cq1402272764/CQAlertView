//
//  ViewController.m
//  CQAlertView
//
//  Created by CQ on 2019/3/21.
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
//    CQAlertView *alert = [CQAlertView sharedInstance];
//    [CQAlertView alert:self alertContent:@"内容" correctBack:^(UIButton * _Nonnull correctButton) {
//        NSLog(@"正确");
//        [alert dismiss];
//    }];
    
    
    UITableView *table = [[UITableView alloc] init];
    table.dataSource = self;
    table.frame = CGRectMake(0, 0, 100, self.view.bounds.size.height - 200);
    
    [CQAlertView alertWithTitle:@"tishi" cancelText:@"" correctText:@"" alertViewController:self actionsView:table correctBack:^(UIButton * _Nonnull correctButton) {
        NSLog(@"==");
    } cancelBack:^(UIButton * _Nonnull cancelButton) {
        NSLog(@"");
    }];
    
    
    NSLog(@"===11");
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
