//
//  LoginViewController.h
//  Lemon
//
//  Created by darksnake on 2017/10/15.
//  Copyright © 2017年 darksnake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerificationCodeViewController.h"
#import "NewPSignViewController.h"

@interface LoginViewController : UIViewController


@property (nonatomic,retain)VerificationCodeViewController *identifyCodeVC;

@property(nonatomic,retain)NewPSignViewController *nPSignVC;

@end
