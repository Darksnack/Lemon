//
//  setUpPasswordVC.m
//  Lemon
//
//  Created by darksnake on 2017/10/14.
//  Copyright © 2017年 darksnake. All rights reserved.
//

#import "setUpPasswordVC.h"
#import "LoginViewController.h"

@interface setUpPasswordVC ()<UITextFieldDelegate>

@property (nonatomic,strong)UIButton *nextBtn;

@end

@implementation setUpPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpView];
}

#pragma mark - 配置视图
- (void)setUpView{

    UIImageView *phoneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone.png"]];
    
    [phoneImageView setFrame:CGRectMake((self.view.frame.size.width - phoneImageView.frame.size.width)/2, phoneImageView.frame.size.height+100, phoneImageView.frame.size.width, phoneImageView.frame.size.height)];

    UILabel *inputNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 290, phoneImageView.frame.origin.y+phoneImageView.frame.size.height+10, (self.view.frame.size.width - 75)/2, 30)];
    
    UILabel *explainLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 325, inputNumLabel.frame.origin.y+inputNumLabel.frame.size.height+10, 250, 15)];
    
    UIButton *BackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/5, self.view.frame.size.width/5)];
    
    UITextField *password = [[UITextField alloc] initWithFrame:CGRectMake(explainLabel.frame.origin.x, explainLabel.frame.origin.y+explainLabel.frame.size.height+15, explainLabel.frame.size.width, 20)];
    
    _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(password.frame.origin.x+25, password.frame.origin.y+password.frame.size.height+20, 100, 10)];
    
    //“设置登录密码”label具体设置
    [inputNumLabel setBackgroundColor:[UIColor clearColor]];
    [inputNumLabel setText:@"设置登录密码"];
    [inputNumLabel setTextColor:[UIColor blackColor]];
    [inputNumLabel setFont:[UIFont systemFontOfSize:20]];
    [inputNumLabel setTextAlignment:NSTextAlignmentRight];
    
    //密码说明Label
    [explainLabel setBackgroundColor:[UIColor clearColor]];
    [explainLabel setText:@"密码由8-16位英文字母、数字或字符组成"];
    [explainLabel setTextColor:[UIColor blackColor]];
    [explainLabel setFont:[UIFont systemFontOfSize:13]];
    [explainLabel setTextAlignment:NSTextAlignmentRight];

    //返回按钮的具体设置
    [BackBtn setTitle:@"返回" forState:UIControlStateNormal];
    [BackBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    BackBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    BackBtn.layer.borderColor = [[UIColor clearColor] CGColor];
    [BackBtn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];

    //密码文本框具体设置
    //设置边框样式
    [password setBorderStyle:UITextBorderStyleNone];
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,password.frame.size.height-2, password.frame.size.width, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [password addSubview:line];
    
    //设置背景色
    [password setBackgroundColor:[UIColor whiteColor]];
    //默认提示文字
    [password setPlaceholder:@"请输入您的手机号码"];
    [password setFont:[UIFont systemFontOfSize:13]];
    [password setTextColor:[UIColor blackColor]];
    //设置弹出键盘
    [password setKeyboardType:UIKeyboardTypeNumberPad];
    //设置显示外观
    [password setKeyboardAppearance:UIKeyboardAppearanceDefault];
    //边框
    //文字大小
    [password setFont:[UIFont systemFontOfSize:20]];
    //文字样式
    //[];
    //设置输入的最大位数
    //[password.text l];
    //设置清空按钮
    [password setClearButtonMode:UITextFieldViewModeWhileEditing];
    //设置左视图
    UIImageView *eyeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"隐藏@2x.png"]];
    [password setRightView:eyeImage];
    [password setRightViewMode:UITextFieldViewModeAlways];
    [password addTarget:self action:@selector(passwordEditing:) forControlEvents:UIControlEventEditingChanged];
    [password setDelegate:self];
    
    //下一步按钮的具体设置
    [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [_nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _nextBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _nextBtn.layer.borderColor = [[UIColor clearColor] CGColor];
    [_nextBtn addTarget:self action:@selector(nextBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //界面上添加控件
    [self.view addSubview:phoneImageView];
    [self.view addSubview:inputNumLabel];
    [self.view addSubview:explainLabel];
    [self.view addSubview:BackBtn];
    [self.view addSubview:password];
    [self.view addSubview:_nextBtn];
}

#pragma mark - 按钮点击事件
/*
 *返回按钮点击事件
 */
- (void)backBtnClicked{

    //返回上一界面，同时关闭当前界面
    [self dismissViewControllerAnimated:YES completion:nil];

}
/*
 *下一步按钮点击事件
 */
- (void)nextBtnClicked{

    LoginViewController *loginVC = [[LoginViewController alloc] init];
    //loginVC.identifyCodeVC = self.identifyVC;
    [self presentViewController:loginVC animated:NO completion:nil];

}
#pragma mark - 文本框变更事件
/*
 *文本框编辑事件
 */
- (void)passwordEditing:(UITextField *)textfield{

    //判断密码位数是否是8-16位
    if (textfield.text.length >= 8 & textfield.text.length <= 16) {
        //需要对输入的密码进行check，是不是符合密码创建规则-todo
        [_nextBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }

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
