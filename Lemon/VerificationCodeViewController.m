//
//  VerificationCodeViewController.m
//  Lemon
//
//  Created by darksnake on 2017/10/13.
//  Copyright © 2017年 darksnake. All rights reserved.
//

#import "VerificationCodeViewController.h"
#import "WLUnitField.h"

@interface VerificationCodeViewController ()

@end

@implementation VerificationCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏按钮设置
    [self addNavBarButtonItem];
    [self setUpView];
}
#pragma mark - 导航栏按钮设置
- (void)addNavBarButtonItem{
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedBackBtn)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
}
#pragma mark - 配置视图
- (void)setUpView{
    
    UIImageView *phoneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone.png"]];
    
    [phoneImageView setFrame:CGRectMake((self.view.frame.size.width - phoneImageView.frame.size.width)/2, phoneImageView.frame.size.height+100, phoneImageView.frame.size.width, phoneImageView.frame.size.height)];
    
    UILabel *inputNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 290, phoneImageView.frame.origin.y+phoneImageView.frame.size.height+10, (self.view.frame.size.width - 75)/2, 30)];
    
    UILabel *teleNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 300, inputNumLabel.frame.origin.y+inputNumLabel.frame.size.height+10, 24, 15)];
    
    //第一行label具体设置
    [inputNumLabel setBackgroundColor:[UIColor clearColor]];
    [inputNumLabel setText:@"请输入验证码"];
    [inputNumLabel setTextColor:[UIColor blackColor]];
    [inputNumLabel setFont:[UIFont systemFontOfSize:20]];
    [inputNumLabel setTextAlignment:NSTextAlignmentRight];
    
    //第二行label的具体设置
    [teleNumLabel setBackgroundColor:[UIColor clearColor]];
    [teleNumLabel setText:self.teleNum];
    [teleNumLabel setTextColor:[UIColor lightGrayColor]];
    [teleNumLabel setFont:[UIFont systemFontOfSize:13]];
    [teleNumLabel setTextAlignment:NSTextAlignmentRight];
    
    [self.view addSubview:phoneImageView];
    [self.view addSubview:inputNumLabel];
    [self.view addSubview:teleNumLabel];
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
#pragma mark - 导航栏按钮点击事件
- (void)onClickedBackBtn{

    
    
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
