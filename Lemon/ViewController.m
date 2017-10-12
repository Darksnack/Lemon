//
//  ViewController.m
//  Lemon
//
//  Created by darksnake on 2017/10/12.
//  Copyright © 2017年 darksnake. All rights reserved.
//

#import "ViewController.h"
#import "NewPSignViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpView];
}
- (void)setUpView{
    
    //设置图片
    UIImageView *LemonImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    UIImageView *LemonFontImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"柠檬嘀送，一嘀就送.png"]];
    
    [LemonImageV setFrame:CGRectMake((self.view.frame.size.width - LemonImageV.frame.size.width)/2, (self.view.frame.size.height - LemonImageV.frame.size.height)/2 - 100, LemonImageV.frame.size.width, LemonImageV.frame.size.height)];
    [LemonFontImageV setFrame:CGRectMake((self.view.frame.size.width - LemonFontImageV.frame.size.width)/2, LemonImageV.frame.origin.y+LemonImageV.frame.size.height+20, LemonFontImageV.frame.size.width, LemonFontImageV.frame.size.height)];
    
    //创建立即启程的按钮
    UIButton *getAwaybtn = [[UIButton alloc] initWithFrame:CGRectMake(LemonImageV.frame.origin.x, self.view.frame.size.height-200, LemonImageV.frame.size.width, 35)];
    
    //按钮的具体设置
    getAwaybtn.backgroundColor = [UIColor whiteColor];
    [getAwaybtn setTitle:@"立即启程" forState:UIControlStateNormal];
    [getAwaybtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    getAwaybtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [getAwaybtn.layer setMasksToBounds:YES];
    getAwaybtn.clipsToBounds = YES;
    getAwaybtn.layer.cornerRadius = 5;
    getAwaybtn.layer.borderColor = [[UIColor greenColor] CGColor];
    getAwaybtn.layer.borderWidth = 3;
    [getAwaybtn addTarget:self action:@selector(ReactionOfgetAwaybtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加图片和按钮
    [self.view addSubview: LemonImageV];
    [self.view addSubview:LemonFontImageV];
    [self.view addSubview:getAwaybtn];
    
}

- (void)ReactionOfgetAwaybtnClicked:(UIButton *)btn{

    NewPSignViewController *NewPVC = [[NewPSignViewController alloc] init];
    UINavigationController *NewPNav = [[UINavigationController alloc] initWithRootViewController:NewPVC];
    [self presentViewController:NewPNav animated:YES completion:nil];
    
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
