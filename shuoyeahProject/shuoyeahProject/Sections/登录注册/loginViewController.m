//
//  loginViewController.m
//  shuoyeahProject
//
//  Created by shuoyeah on 16/7/28.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"登录测试%@", [GVUserDefaults standardUserDefaults].userName);
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)loginButtonAction:(UIButton *)sender {
    [GVUserDefaults standardUserDefaults].userName = _accountTextField.text;
    NSMutableDictionary * diction = [NSMutableDictionary dictionary];
    
    [HttpRequest postWithURL:@"" params:diction andNeedHub:YES success:^(id responseObject) {
        
        [GVUserDefaults standardUserDefaults].userName = _accountTextField.text;
        
    } failure:^(NSError *error) {
        
    }];
    
}
@end
