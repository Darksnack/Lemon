//
//  VerificationCodeViewController.m
//  Lemon
//
//  Created by darksnake on 2017/10/13.
//  Copyright © 2017年 darksnake. All rights reserved.
//

#import "VerificationCodeViewController.h"
#import "WLUnitField.h"
#import "setUpPasswordVC.h"

@interface VerificationCodeViewController ()<UITextFieldDelegate,WLUnitFieldDelegate>

@property (nonatomic,strong)WLUnitField *idenCodeTextFie;

@end

@implementation VerificationCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //配置视图
    [self setUpView];
}

#pragma mark - 配置视图
- (void)setUpView{
    
    UIImageView *phoneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone.png"]];
    
    [phoneImageView setFrame:CGRectMake((self.view.frame.size.width - phoneImageView.frame.size.width)/2, phoneImageView.frame.size.height+100, phoneImageView.frame.size.width, phoneImageView.frame.size.height)];
    
    UILabel *inputNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 290, phoneImageView.frame.origin.y+phoneImageView.frame.size.height+10, (self.view.frame.size.width - 75)/2, 30)];
    
    UILabel *teleNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 325, inputNumLabel.frame.origin.y+inputNumLabel.frame.size.height+10, self.teleNum.length+100, 15)];
    
    UIButton *sendOutBtn = [[UIButton alloc] initWithFrame:CGRectMake(teleNumLabel.frame.origin.x + teleNumLabel.frame.size.width, inputNumLabel.frame.origin.y+inputNumLabel.frame.size.height+10, 75, 15)];
    
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(sendOutBtn.frame.origin.x+sendOutBtn.frame.size.width, inputNumLabel.frame.origin.y+inputNumLabel.frame.size.height+10, 75, 15)];
    
    UIButton *BackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/5, self.view.frame.size.width/5)];
    
    //底部图片设置（柠檬嘀送）
    UIImageView *bottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"形状-1.png"]];
    
    [bottomImageView setFrame:CGRectMake((self.view.frame.size.width - bottomImageView.frame.size.width)/2, self.view.frame.size.height-bottomImageView.frame.size.height-10, bottomImageView.frame.size.width, bottomImageView.frame.size.height)];
    
    //第一行label具体设置
    [inputNumLabel setBackgroundColor:[UIColor clearColor]];
    [inputNumLabel setText:@"输入验证码"];
    [inputNumLabel setTextColor:[UIColor blackColor]];
    [inputNumLabel setFont:[UIFont systemFontOfSize:20]];
    [inputNumLabel setTextAlignment:NSTextAlignmentRight];
    
    //第二行label的具体设置
    [teleNumLabel setBackgroundColor:[UIColor clearColor]];
    [teleNumLabel setText:self.teleNum];
    [teleNumLabel setTextColor:[UIColor lightGrayColor]];
    [teleNumLabel setFont:[UIFont systemFontOfSize:13]];
    [teleNumLabel setTextAlignment:NSTextAlignmentRight];
    
    //重新发送按钮的具体设置
    [sendOutBtn setTitle:@"重新发送" forState:UIControlStateNormal];
    [sendOutBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    sendOutBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    sendOutBtn.layer.borderColor = [[UIColor clearColor] CGColor];
    [sendOutBtn addTarget:self action:@selector(sendOutBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //没收到label具体设置
    [infoLabel setBackgroundColor:[UIColor clearColor]];
    [infoLabel setText:@"没收到？"];
    [infoLabel setTextColor:[UIColor lightGrayColor]];
    [infoLabel setFont:[UIFont systemFontOfSize:13]];
    [infoLabel setTextAlignment:NSTextAlignmentLeft];
    
    //铺设验证码框
    _idenCodeTextFie = [[WLUnitField alloc] initWithInputUnitCount:4];
    _idenCodeTextFie.frame = CGRectMake(teleNumLabel.frame.origin.x+10, infoLabel.frame.origin.y+infoLabel.frame.size.height+25, 240, 50);
    _idenCodeTextFie.unitSpace = 12;
    _idenCodeTextFie.trackTintColor = [UIColor greenColor];
    [_idenCodeTextFie addTarget:self action:@selector(checkidentifyCode) forControlEvents:UIControlEventEditingChanged];
    
    //返回按钮的具体设置
    [BackBtn setTitle:@"返回" forState:UIControlStateNormal];
    [BackBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    BackBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    BackBtn.layer.borderColor = [[UIColor clearColor] CGColor];
    [BackBtn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //控件铺设到界面上
    [self.view addSubview:BackBtn];
    [self.view addSubview:phoneImageView];
    [self.view addSubview:inputNumLabel];
    [self.view addSubview:teleNumLabel];
    [self.view addSubview:sendOutBtn];
    [self.view addSubview:infoLabel];
    [self.view addSubview:bottomImageView];
    [self.view addSubview:_idenCodeTextFie];
}
#pragma mark - 点击背景收回键盘
/*
 *点击背景回收键盘
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
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
#pragma mark - 验证码验证是否正确方法

/*
 *检验验证码是否正确
 */
- (void)checkidentifyCode{
    
    if (_idenCodeTextFie.text.length == 4) {
        //向服务器发送验证信息-todo
        NSLog(@"%@",_idenCodeTextFie.text);
        @try{
            
            setUpPasswordVC *setUpPasswordvc = [[setUpPasswordVC alloc] init];
            setUpPasswordvc.identifyVC = self;
            [self presentViewController:setUpPasswordvc animated:NO completion:nil];
        }
        @catch(NSException *exception) {
            NSLog(@"exception:%@", exception);
        }
        @finally {
            
        }
    }
    
}

#pragma mark - 导航栏按钮点击事件
/*
 *返回按钮点击事件
 */
- (void)backBtnClicked{
    
    //返回上一界面，同时关闭当前界面
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark - 按钮点击事件
- (void)sendOutBtnClicked{

    //向服务器发送请求验证码的请求-todo
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
