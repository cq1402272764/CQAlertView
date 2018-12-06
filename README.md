# CQAlertView
## 控件简介
快速集成CQAlertView，自定义消息内容。
### 【注】
- 注：所有颜色属性请先设置 alertWithTitle:cancelText:correctText:showAlertView:messageHeight:actionsView:correctBack:cancalBack: 方法，才可以设置成功
### CocoaPods

1. Add `pod 'CQAlertView',` to your Podfile.

2. Run `pod install` or `pod update`.


## <a id="AlertView"></a> AlertView【示例】
```objc
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
```
## 界面显示

![image](https://github.com/cq1402272764/CQAlertView/blob/master/Res/CQAlertView.gif)
