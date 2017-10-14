//
//  NewPSignViewController.m
//  Lemon
//
//  Created by darksnake on 2017/10/12.
//  Copyright © 2017年 darksnake. All rights reserved.
//

#import "NewPSignViewController.h"
#import "VerificationCodeViewController.h"

@interface NewPSignViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UIButton *nextBtn;
@property (nonatomic,strong) UITextField *teleNumber;

@end

@implementation NewPSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    //导航栏按钮设置
    [self addNavBarButtonItem];
    
    //配置视图
    [self setUpView];
}
#pragma mark - 导航栏按钮设置
- (void)addNavBarButtonItem{
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedBackBtn)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"jump" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedJumpBtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}
#pragma mark - 配置视图
- (void)setUpView{

    UIImageView *phoneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone.png"]];
    
    [phoneImageView setFrame:CGRectMake((self.view.frame.size.width - phoneImageView.frame.size.width)/2, phoneImageView.frame.size.height+100, phoneImageView.frame.size.width, phoneImageView.frame.size.height)];
    
    UILabel *inputNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 290, phoneImageView.frame.origin.y+phoneImageView.frame.size.height+10, (self.view.frame.size.width - 75)/2, 30)];
    
    UILabel *explainLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 300, inputNumLabel.frame.origin.y+inputNumLabel.frame.size.height+10,self.view.frame.size.width-(self.view.frame.size.width - 310)*2 , 15)];
    
    //第一行label具体设置
    [inputNumLabel setBackgroundColor:[UIColor clearColor]];
    [inputNumLabel setText:@"输入手机号"];
    [inputNumLabel setTextColor:[UIColor blackColor]];
    [inputNumLabel setFont:[UIFont systemFontOfSize:20]];
    [inputNumLabel setTextAlignment:NSTextAlignmentRight];
    
    //第二行label的具体设置
    [explainLabel setBackgroundColor:[UIColor clearColor]];
    [explainLabel setText:@"请输入您的手机号，方便司机与您联系"];
    [explainLabel setTextColor:[UIColor lightGrayColor]];
    [explainLabel setFont:[UIFont systemFontOfSize:13]];
    [explainLabel setTextAlignment:NSTextAlignmentRight];
    
    UILabel *phoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    [phoneNumber setBackgroundColor:[UIColor clearColor]];
    [phoneNumber setText:@"中国 +86"];
    [phoneNumber setTextColor:[UIColor blackColor]];
    [phoneNumber setFont:[UIFont systemFontOfSize:13]];
    [phoneNumber setTextAlignment:NSTextAlignmentLeft];
    
    //创建用户名文本框
    _teleNumber = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 75, explainLabel.frame.origin.y+explainLabel.frame.size.height+15, self.view.frame.size.width - 100, 30)];

    //设置边框样式
    [_teleNumber setBorderStyle:UITextBorderStyleNone];

    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,_teleNumber.frame.size.height-2, _teleNumber.frame.size.width, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [_teleNumber addSubview:line];
    
    //设置背景色
    [_teleNumber setBackgroundColor:[UIColor whiteColor]];
    //默认提示文字
    [_teleNumber setPlaceholder:@"请输入您的手机号码"];
    [_teleNumber setFont:[UIFont systemFontOfSize:13]];
    [_teleNumber setTextColor:[UIColor lightGrayColor]];
    //设置弹出键盘
    [_teleNumber setKeyboardType:UIKeyboardTypeNumberPad];
    //设置显示外观
    [_teleNumber setKeyboardAppearance:UIKeyboardAppearanceDefault];
    //边框
    //文字大小
    [_teleNumber setFont:[UIFont systemFontOfSize:20]];
    //文字样式
    //[];
    //设置输入的最大位数
    //[_teleNumber.text l];
    //设置清空按钮
    [_teleNumber setClearButtonMode:UITextFieldViewModeWhileEditing];
    //设置圆角
    [_teleNumber.layer setMasksToBounds:YES];
    [_teleNumber.layer setCornerRadius:4];
    //设置左视图
    [_teleNumber setLeftView:(UIView *) phoneNumber];
    [_teleNumber setLeftViewMode:UITextFieldViewModeAlways];
    [_teleNumber setDelegate:self];
    
    //下一步按钮的创建
    _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 50*2)/2, _teleNumber.frame.origin.y+_teleNumber.frame.size.height+50, 100, 30)];
    
    //按钮的详细设置
    [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [_nextBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_nextBtn addTarget:self action:@selector(_nextBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //底部图片设置（柠檬嘀送）
    UIImageView *bottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"形状-1.png"]];
    
    [bottomImageView setFrame:CGRectMake((self.view.frame.size.width - bottomImageView.frame.size.width)/2, self.view.frame.size.height-bottomImageView.frame.size.height-10, bottomImageView.frame.size.width, bottomImageView.frame.size.height)];
    
    //图片的详细设置
    
    
    [self.view addSubview:phoneImageView];
    [self.view addSubview:bottomImageView];
    [self.view addSubview:inputNumLabel];
    [self.view addSubview:explainLabel];
    [self.view addSubview:_teleNumber];
    [self.view addSubview:_nextBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}
#pragma mark - 隐藏导航栏
/*
 *隐藏导航栏
 */
- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    //不让其他页面的导航栏变为透明 ，重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
#pragma mark - 点击背景收回键盘
/*
 *点击背景回收键盘
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - 按钮点击事件
- (void)onClickedBackBtn{

    //返回上一界面，同时关闭当前界面
    [self dismissViewControllerAnimated:YES completion:nil];

}
/*
 *跳转到主界面，不发送消息
 */
- (void)onClickedJumpBtn{
    
    //跳转
    
}

/*
 *跳转到下一界面，需要向服务器发送信息（电话号码）
 */
- (void)_nextBtnClicked{

    VerificationCodeViewController *CodeVC = [[VerificationCodeViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:CodeVC];
    
    CodeVC.teleNum = self.teleNumber.text;
    NSLog(@"%@", CodeVC.teleNum);
    [self.navigationController presentViewController:CodeVC animated:NO completion:nil];
}

#pragma mark - textField的编辑响应事件
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //判断电话号码
    /*NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    */
    
    NSLog(@"%lu",self.teleNumber.text.length);
    if (textField == self.teleNumber) {
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        else if (self.teleNumber.text.length >= 11){
            self.teleNumber.text = [textField.text substringToIndex:11];
            [_nextBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            return NO;
        }
    }
    return YES;

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
