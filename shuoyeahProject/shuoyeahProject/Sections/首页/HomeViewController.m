//
//  HomeViewController.m
//  shuoyeahProject
//
//  Created by shuoyeah on 16/7/28.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "HomeViewController.h"
#import "JZAlbumViewController.h"
#import "UILabel+ljjRich.h"
#import "UIButton+ljjClick.h"
#import "NSTimer+MAC.h"
//#import "UIViewController+KNSemiModal.h"
#import "testSliderViewController.h"
#import "ljjUrlWebViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "GVUserDefaults+ljjSaveUserData.h"
@interface HomeViewController (){

    UIButton * button ;
    UIButton * button1 ;
}
@property (nonatomic,copy)NSString * string;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = WHITEColor;
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    [dict setValue:nil forKey:@"key"];
    [dict setValue:@"123" forKey:@"ceshi"];
    DLog(@"%@",dict);
      //[SVProgressHUD setInfoImage:nil];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
//    
//    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"tishi" message:@"xinxi1" delegate:self cancelButtonTitle:@"fou" otherButtonTitles:@"SHI",nil];
//   
//   // alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//    
//    [alert ljj_clickedButtonAtIndexWithBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
//        
//        if (buttonIndex==0) {
//            
//            NSLog(@"gun");
//        }else{
//        
//            NSLog(@"hshhshshs");
//        }
//        
//    }];
//  //  [alert show];
//    
//    UIAlertController * alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"12345" preferredStyle:UIAlertControllerStyleAlert];
//    
//    [alert1 addAction:[UIAlertAction actionWithTitle:@"定"style:UIAlertActionStyleDestructive handler:^(UIAlertAction*action) {  NSLog(@"点击了确定按钮"); }]];
    
   
  //  [SVProgressHUD setBackgroundColor:BlackColor];
   // [[GVUserDefaults standardUserDefaults] ];
   // [[NSUserDefaults standardUserDefaults] registerDefaults:@{
//                                                              @"userName": @"default11",
//                                                              @"userId": @11,
//                                                              @"integerValue": @12311,
//                                                              @"boolValue": @YES,
//                                                              @"floatValue": @12.311,
//                                                              }];
//测试苏大声道
//  NSDictionary * dic = @{
//      ;@"userName": @"刘建基",
//      @"userId": @23,
//      @"integerValue": @837802,
//      @"boolValue": @YES,
//      @"floatValue": @66666666,
//      };
//   dic = [[GVUserDefaults standardUserDefaults] setupDefaults];
//    NSLog(@"%@",[GVUserDefaults standardUserDefaults].userName);
    // Do any additional setup after loading the view.
//    [HttpRequest postWithURL:@"" params:@{} success:^(id responseObject) {
//
//    } failure:^(NSError *error) {
//
//    }];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //WEAKSELF
    button1 = [myLjjTools createBlockButtonWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-200, 40) andTitle:@"测试GCD" andTitleFont:FontSize(16) andTitleColor:WHITEColor andBgColor:LThemeColor andCornerRadius:3.f];
    [button1 setBackgroundImage:[UIImage imageNamed:@"测试1"] forState:UIControlStateNormal];
 //   button1.imageRect = CGRectMake(5, 5, 30, 30);
//    button1.titleRect = CGRectMake(40, 5, 100, 30);
//    [button1 addActionHandler:^(NSInteger tag) {
//        
//     //   [weakSelf loadShakeAnimationForView:button1];
////        [weakSelf createMainGCD];
//      //  [weakSelf presentSemiViewController:ljj];
//    }];
    
    
    [self.view addSubview:button1];
//
//    UILabel * label = [myLjjTools createLabelWithFrame:CGRectMake(100, 200, 250, 40) andTitle:@"ceshiyixi测试一定要是一定要是第一" andTitleFont:FontSize(16) andTitleColor:BlackColor andTextAlignment:NSTextAlignmentCenter andBgColor:WHITEColor];
//    [label createLabelTextWithChangeColorTxt:@"测试" withColor:[UIColor orangeColor]];
//    
//    [label addTapGuester:YES with:^{
//        [button endSubmitting];
//        [SVProgressHUD showInfoWithStatus:@"测试一下测试议案"];
//         [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
//    }];
//     [self.view addSubview:label];
//    
    button = [myLjjTools createBaseButtonWithFrame:CGRectMake(-100, -250, 140, 60) andTitle:@"发送验证码" andTitleFont:FontSize(16) andTitleColor:BlackColor andBgColor:LThemeColor andSelecter:@selector(buttonClick:) andTarget:self andCornerRadius:4.0];
    //button.touchAreaInsets = UIEdgeInsetsMake(100, 100, 100, 100);
    [self.view addSubview:button];
    
//    UITextField * textFiled = [myLjjTools createTextFieldFrame:CGRectMake(100, 300, 222, 40) andBgColor:WHITEColor andPlaceholder:@"KUAIXIE" andTextColor:LThemeColor andTextFont:FontSize(16) andReturnType:UIReturnKeyDone];
//    [self.view addSubview:textFiled];
  //    JZAlbumViewController *jzAlbumVC = [[JZAlbumViewController alloc]init];
//    
//    jzAlbumVC.currentIndex =2;//这个参数表示当前图片的index，默认是0
//    
//    jzAlbumVC.imgArr = [NSMutableArray arrayWithArray:@[@"测试1.jpg",@"测试2.jpg",@"测试3.jpg",@"测试4.jpg",@"测试5.jpg"]];//图片数组，可以是url，也可以是UIImage
//    
//    [self.navigationController presentViewController:jzAlbumVC animated:YES completion:nil];

    [UIView animateWithDuration:3 animations:^{
        button.frame = CGRectMake(100, 250, 140, 60);
    }];
 
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:3];
//    button.frame = CGRectMake(100, 250, 140, 60);
//    [UIView commitAnimations];
    
//    [UIView animateKeyframesWithDuration:3 delay:1 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
//        button.frame = CGRectMake(100, 250, 140, 60);
//    } completion:^(BOOL finished) {
//        
//    }];
    
//    UIImageView * imageView = [myLjjTools createImageViewWithFrame:CGRectMake(100, 440, 100, 80) andImageName:@"测试1" andBgColor:WHITEColor];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [self.view addSubview:imageView];
//   
//    [imageView setAnimationImages:@[ [UIImage imageNamed:@"测试1"], [UIImage imageNamed:@"测试2"], [UIImage imageNamed:@"测试3"], [UIImage imageNamed:@"测试4"]]];
//    [imageView setAnimationDuration:1];
//    [imageView setAnimationRepeatCount:2];
//    [imageView startAnimating];
//    
//    [UIView animateWithDuration:3 delay:1 usingSpringWithDamping:0.5 initialSpringVelocity:0.4 options:UIViewAnimationOptionCurveLinear animations:^{
//       
//        button1.frame = CGRectMake(100, 100, SCREEN_WIDTH-200, 40);
//        
//    } completion:^(BOOL finished) {
//        
//    }];
//    
//    
//    UIColor *color = [UIColor redColor];
//    [color set]; //设置线条颜色
//    UIBezierPath * path = [UIBezierPath bezierPath];
//    path.lineWidth=5;
//    path.lineCapStyle = kCGLineCapRound;
//    path.lineJoinStyle = kCGLineJoinRound;
//    [path moveToPoint:CGPointMake(100.0, 0.0)];
//    [path addLineToPoint:CGPointMake(200.0, 40.0)];
//    [path addLineToPoint:CGPointMake(160, 140)];
//    [path addLineToPoint:CGPointMake(40.0, 140)];
//    [path addLineToPoint:CGPointMake(0.0, 40.0)];
//    [path closePath];
//    [path stroke];
    
    
}


- (void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
//    [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//     button.frame = CGRectMake(-100, -250, 140, 60);
//} completion:^(BOOL finished) {
//    button1.frame = CGRectMake(10, 100, SCREEN_WIDTH-200, 40);
//}];

}


-(void)createMainGCD{
    
//    [UIView animateWithDuration:3 delay:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
//        [button1 setTitle:@"变一下" forState:UIControlStateNormal];
//        [button1 setBackgroundColor:WHITEColor];
//    } completion:^(BOOL finished) {
//        
//    }];

//    [UIView transitionWithView:button1 duration:2 options:UIViewAnimationOptionTransitionCurlUp animations:^{
//                [button1 setTitle:@"变一下" forState:UIControlStateNormal];
//               // [button1 setBackgroundColor:WHITEColor];
//
//    } completion:^(BOOL finished) {
//        
//    }];
    
    
//    dispatch_queue_t queue = dispatch_queue_create("gcdtest.rongfzh.yc", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        NSTimer * timer = [NSTimer timerWithTimeInterval:3 block:^{
//            NSLog(@"侧死");
//        } repeats:YES];
//        [timer resumeTimer];
//
//    });
//    dispatch_async(queue, ^{
//        [NSThread sleepForTimeInterval:4];
//        NSLog(@"dispatch_async2");
//    });
//    dispatch_barrier_async(queue, ^{
//        NSLog(@"dispatch_barrier_async");
//        [NSThread sleepForTimeInterval:4];
//        
//    });
//    dispatch_async(queue, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"dispatch_async3");  
//    });
   // dispatch_release(group);
}

-(void)buttonClick:(UIButton*)btn{
//    btn.selected = !btn.selected;
//    if(btn.selected){
//    [btn beginSubmitting:@"提交中..."];
//    }else{
//    [btn endSubmitting];
//    }
//    [UIView animateWithDuration:1 delay:1 usingSpringWithDamping:0.1 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
//        button.frame = CGRectMake(100, 220, 140, 60);
//    } completion:^(BOOL finished) {
//        
//    }];

    [btn sendMessageBegin:WHITEColor andChange:[UIColor orangeColor]];
    ljjUrlWebViewController * ljjUrl = [[ljjUrlWebViewController alloc]init];
    [self.navigationController pushViewController:ljjUrl animated:YES];
    
    

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
