//
//  LoginViewController.m
//  Lemon
//
//  Created by darksnake on 2017/10/15.
//  Copyright © 2017年 darksnake. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "NewPSignViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UIButton *immLoginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpView];
}
#pragma mark - 配置视图
- (void)setUpView{

    UIImageView *LemonImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    [LemonImageV setFrame:CGRectMake((self.view.frame.size.width - LemonImageV.frame.size.width)/2, (self.view.frame.size.height - LemonImageV.frame.size.height)/2 - 100, LemonImageV.frame.size.width, LemonImageV.frame.size.height)];
    
    UIImageView *phoneView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"手机-(1)@2x.png"]];
    UIImageView *LockerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"隐藏@2x.png"]];
    
    //创建用户名文本框
    UITextField *userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-240)/2, LemonImageV.frame.origin.y+LemonImageV.frame.size.height+30, 240, 50)];
    
    //设置背景色
    [userNameTextField setBackgroundColor:[UIColor lightGrayColor]];
    //默认提示文字
    [userNameTextField setPlaceholder:@"请输入您的手机号码"];
    //
    [userNameTextField setFont:[UIFont systemFontOfSize:13]];
    [userNameTextField setTextColor:[UIColor blackColor]];
    //设置弹出键盘
    [userNameTextField setKeyboardType:UIKeyboardTypeNumberPad];
    //设置显示外观
    [userNameTextField setKeyboardAppearance:UIKeyboardAppearanceAlert];
    //设置清空按钮
    [userNameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    //设置圆角
    [userNameTextField.layer setMasksToBounds:YES];
    [userNameTextField.layer setCornerRadius:4];
    //设置左视图
    [userNameTextField setLeftView:phoneView];
    [userNameTextField setLeftViewMode:UITextFieldViewModeAlways];
    [userNameTextField setDelegate:self];
    
    //创建密码文本框
    UITextField *passwordTextfield = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-240)/2, userNameTextField.frame.origin.y+userNameTextField.frame.size.height, 240, 50)];
    
    //设置背景色
    [passwordTextfield setBackgroundColor:[UIColor lightGrayColor]];
    //默认提示文字
    [passwordTextfield setPlaceholder:@"输入密码"];
    //
    [passwordTextfield setFont:[UIFont systemFontOfSize:13]];
    [passwordTextfield setTextColor:[UIColor blackColor]];
    //设置弹出键盘
    [passwordTextfield setKeyboardType:UIKeyboardTypeNumberPad];
    //设置显示外观
    [passwordTextfield setKeyboardAppearance:UIKeyboardAppearanceAlert];
    //设置清空按钮
    [passwordTextfield setClearButtonMode:UITextFieldViewModeWhileEditing];
    //设置圆角
    [passwordTextfield.layer setMasksToBounds:YES];
    [passwordTextfield.layer setCornerRadius:4];
    //设置左视图
    [passwordTextfield setLeftView:LockerView];
    [passwordTextfield setLeftViewMode:UITextFieldViewModeAlways];
    [passwordTextfield setDelegate:self];
    
    _immLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake(passwordTextfield.frame.origin.x, passwordTextfield.frame.origin.y+passwordTextfield.frame.size.height+35, 240, 50)];
    _immLoginBtn.backgroundColor = [UIColor yellowColor];
    [_immLoginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
    [_immLoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _immLoginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _immLoginBtn.layer.masksToBounds = YES;
    _immLoginBtn.layer.cornerRadius = 16;
    [_immLoginBtn addTarget:self action:@selector(LoginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //底部图片设置（柠檬嘀送）
    UIImageView *bottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"形状-1.png"]];
    
    [bottomImageView setFrame:CGRectMake((self.view.frame.size.width - bottomImageView.frame.size.width)/2, self.view.frame.size.height-bottomImageView.frame.size.height-10, bottomImageView.frame.size.width, bottomImageView.frame.size.height)];
    
    UIButton *forgetBtn = [[UIButton alloc] initWithFrame:CGRectMake(_immLoginBtn.frame.origin.x, _immLoginBtn.frame.origin.y+_immLoginBtn.frame.size.height+5, _immLoginBtn.frame.size.width/3, 20)];
    
    UIButton *signBtn = [[UIButton alloc] initWithFrame:CGRectMake(_immLoginBtn.frame.origin.x+_immLoginBtn.frame.size.width-_immLoginBtn.frame.size.width/3, _immLoginBtn.frame.origin.y+_immLoginBtn.frame.size.height+5, _immLoginBtn.frame.size.width/3, 20)];
    
    //忘记密码按钮具体设置
    forgetBtn.backgroundColor = [UIColor whiteColor];
    [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [forgetBtn addTarget:self action:@selector(forgetBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //新用户按钮具体设置
    signBtn.backgroundColor = [UIColor whiteColor];
    [signBtn setTitle:@"新用户注册" forState:UIControlStateNormal];
    [signBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    signBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [signBtn addTarget:self action:@selector(signBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:LemonImageV];
    [self.view addSubview:userNameTextField];
    [self.view addSubview:passwordTextfield];
    [self.view addSubview:_immLoginBtn];
    [self.view addSubview:bottomImageView];
    [self.view addSubview:forgetBtn];
    [self.view addSubview:signBtn];
    
}
#pragma mark -- 按钮点击事件
- (void) LoginBtnClicked{

    MainViewController *mainVC = [[MainViewController alloc] init];
    
    /*
     将用户信息存入单例中，当点登出按钮时，再行清空
     根据手机号和密码向服务器请求，当正确时返回用户信息，并进入主页，失败时显示错误类型并显示
     */
    
    [self presentViewController:mainVC animated:NO completion:nil];

}
- (void)forgetBtnClicked{

    [self.identifyCodeVC dismissViewControllerAnimated:YES completion:nil];
}

- (void)signBtnClicked{

    //[self.nPSignVC dismissViewControllerAnimated:NO completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
