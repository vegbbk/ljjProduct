//
//  baseTabBarViewController.m
//  lifeKnown
//
//  Created by shuoyeah on 16/3/6.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "baseTabBarViewController.h"
#import "GWNavC.h"
#import "HomeViewController.h"
#import "myViewController.h"
#import "loginViewController.h"
#import "testSliderViewController.h"
@interface baseTabBarViewController ()<UIAlertViewDelegate>
{
    NSString *APPID;
    NSString *trackViewUrl;
    
}
@end

@implementation baseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBar];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentLoginAlert) name:presentLoginViewMessage object:nil];
    [self checkNewAppVersion];
}

- (void)createTabBar
{
    
    HomeViewController * head = [[HomeViewController alloc]init];
    
    myViewController * my = [[myViewController alloc]init];
    
    NSMutableArray * tabArr = [NSMutableArray arrayWithObjects:head,my,nil];
    
    NSArray * titleArr = @[@"首页",@"我的"];
    
    NSArray * normalArr = @[@"",@""];
    
    NSArray * selectArr = @[@"",@""];
    
    //For循环创建TabBar
    for (int i = 0; i < 2; i++) {
        //将视图控制器转换为导航控制器
        UIViewController * vc = tabArr[i];
        //转换
        vc.title = titleArr[i];
        GWNavC * nav = [[GWNavC alloc]initWithRootViewController:vc];
        nav.title = titleArr[i];
        //将vcArray中的所有视图控制器替换为导航控制器
        [tabArr replaceObjectAtIndex:i withObject:nav];
        //设置图片 渲染模式 保证TabBar显示图片与给定图片一致
       
        UIImage * normalImage = [UIImage imageNamed:normalArr[i]];
        
        UIImage * selectImage = [UIImage imageNamed:selectArr[i]];
        
        //对图片进行渲染
        nav.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        nav.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
         [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kThemeColor} forState:UIControlStateSelected];

        
    }
    //self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
    //标签栏控制器管理视图
    self.viewControllers = tabArr;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

#pragma -mark -------弹出登陆提示--------
- (void)presentLoginAlert
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"您还未登陆？" message:@"" delegate:self cancelButtonTitle:@"稍后再说" otherButtonTitles:@"去登陆", nil];
    alert.tag=35200;
    [alert show];
    
}
#pragma -mark -------弹出登陆界面--------
- (void)presentLoginVC
{
    loginViewController *loginVC=[[loginViewController alloc] init];
    GWNavC *gwnav=[[GWNavC alloc] initWithRootViewController:loginVC];
    
    [self presentViewController:gwnav animated:YES completion:^{
        loginVC.navigationItem.leftBarButtonItem=nil;
    }];
    

}

#pragma -mark --------------------------------UIAlertViewDelegate------------------------------

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==35200) {
        if (buttonIndex==1) {
            //登陆
            loginViewController *loginVC=[[loginViewController alloc] init];
            GWNavC *gwnav=[[GWNavC alloc] initWithRootViewController:loginVC];
            [self presentViewController:gwnav animated:YES completion:nil];
        }
    }
    
    
}


#pragma -mark -------登陆--------每次都登陆
- (void)loginWithUsername:(NSString *)username password:(NSString *)password
{
    
    
}



- (void)alipayCallback
{
    
}



#pragma -mark --------------------------------检查更新------------------------------

#pragma -mark -------版本更新--------

- (void)checkNewAppVersion
{
    
    
}


#pragma -mark --------------------------------tool------------------------------

//将版本号3.3.11转为数字30311
- (NSInteger)transferStringToIntFromSourceStr:(NSString *)sourceStr
{
    NSArray *strArr = [sourceStr componentsSeparatedByString:@"."];
    NSString *firstStr=strArr[0];
    NSString *secondStr=strArr[1];
    NSString *thirdStr=strArr[2];
    //判断第二个数字是一位还是2位
    if (secondStr.length==1)
    {
        secondStr=[NSString stringWithFormat:@"0%@",secondStr];
    }
    
    if (thirdStr.length==1)
    {
        thirdStr=[NSString stringWithFormat:@"0%@",thirdStr];
    }
    NSString *destiStr=[NSString stringWithFormat:@"%@%@%@",firstStr,secondStr,thirdStr];
    NSInteger destiInt=[destiStr integerValue];
    return destiInt;
    
}

@end
