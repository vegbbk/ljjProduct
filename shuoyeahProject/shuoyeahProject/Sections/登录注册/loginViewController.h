//
//  loginViewController.h
//  shuoyeahProject
//
//  Created by shuoyeah on 16/7/28.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;//账号
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;//密码
@property (weak, nonatomic) IBOutlet UIButton *loginButton;//登录
- (IBAction)loginButtonAction:(UIButton *)sender;

@end
