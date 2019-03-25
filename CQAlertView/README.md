# CQAlertView
## 控件简介
快速集成CQAlertView，自定义消息内容。
### 【注】
- 注：所有颜色属性请先设置显示alert方法，才可以设置成功
### CocoaPods

1. Add `pod 'CQAlertView',` to your Podfile.

2. Run `pod install` or `pod update`.


## <a id="AlertView"></a> AlertView【示例】
### 默认方法
```objc
CQAlertView *alert = [[CQAlertView alloc] init];
[alert alert:self alertContent:@"内容内容内容内容内容内容" correctBack:^(UIButton * _Nonnull correctButton) {
    NSLog(@"正确");
}];
alert.titleColor = [UIColor greenColor];
```

### 可修改文字方法
```objc
CQAlertView *alert = [[CQAlertView alloc] init];
[alert alertWithTitle:@"提示" cancelText:@"" correctText:@"" alertViewController:self actionsView:table correctBack:^(UIButton * _Nonnull correctButton) {
    NSLog(@"正确");
} cancelBack:^(UIButton * _Nonnull cancelButton) {
    NSLog(@"取消");
}];
```
## 界面显示

![image](https://github.com/cq1402272764/CQAlertView/blob/master/CQAlertView/Res/CQAlertView.gif)
