//
//  ViewController.m
//  CYMVVMDemo
//
//  Created by echo on 7/26/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewModel.h"
#import "ReactiveCocoa.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (nonatomic, strong) LoginViewModel *loginViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindModel];
}

- (LoginViewModel *)loginViewModel
{
    if (_loginViewModel == nil) {
        _loginViewModel = [[LoginViewModel alloc] init];
    }
    return _loginViewModel;
}

/**
 *  视图模型绑定
 */
- (void)bindModel
{
    //给模型的属性绑定信号
    //只要文本框一改变，就会给account赋值
    RAC(self.loginViewModel.account, account) = _accountField.rac_textSignal;
    RAC(self.loginViewModel.account, pwd) = _pwdField.rac_textSignal;
    
    //绑定登录按钮
    RAC(self.loginBtn, enabled) = self.loginViewModel.enableLoginSignal;
    
    //监听登录点击事件
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        //执行登录操作
        [self.loginViewModel.loginCommonand execute:nil];
    }];
}

@end






