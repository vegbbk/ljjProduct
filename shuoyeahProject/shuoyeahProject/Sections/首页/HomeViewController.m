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
#import "ljjUrlWebViewController.h"
#import "GVUserDefaults+ljjSaveUserData.h"
@interface HomeViewController (){

    UIButton * button ;
}
@property (nonatomic,copy)NSString * string;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    [dict setValue:nil forKey:@"key"];
    [dict setValue:@"123" forKey:@"ceshi"];
    DLog(@"%@",dict);
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
//      @"userName": @"刘建基",
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
    
    UILabel * label = [myLjjTools createLabelWithFrame:CGRectMake(100, 200, 250, 40) andTitle:@"ceshiyixi测试一定要是一定要是第一" andTitleFont:FONTSize(16) andTitleColor:BlackColor andTextAlignment:NSTextAlignmentCenter andBgColor:WHITEColor];
    [label createLabelTextWithChangeColorTxt:@"测试" withColor:[UIColor orangeColor]];
    
    [label addTapGuester:YES with:^{
        [button endSubmitting];
    }];
     [self.view addSubview:label];
    
    button = [myLjjTools createButtonWithFrame:CGRectMake(100, 250, 140, 60) andTitle:@"发送验证码" andTitleFont:FONTSize(16) andTitleColor:BlackColor andBgColor:kThemeColor andSelecter:@selector(buttonClick:) andTarget:self andCornerRadius:4.0];
    button.touchAreaInsets = UIEdgeInsetsMake(100, 100, 100, 100);
    [self.view addSubview:button];
    
    
    UITextField * textFiled = [myLjjTools createTextFieldFrame:CGRectMake(100, 300, 222, 40) andBgColor:BlackColor andPlaceholder:@"KUAIXIE" andTextColor:kThemeColor andTextFont:FONTSize(16) andReturnType:UIReturnKeyDone];
    [self.view addSubview:textFiled];
    UITableView * tableView;
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        _PageIndex=1;
//        [weakSelf loadData:YES];
    }];
   tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        _PageIndex++;
//        [weakSelf loadData:NO];
    }];
//    JZAlbumViewController *jzAlbumVC = [[JZAlbumViewController alloc]init];
//    
//    jzAlbumVC.currentIndex =2;//这个参数表示当前图片的index，默认是0
//    
//    jzAlbumVC.imgArr = [NSMutableArray arrayWithArray:@[@"测试1.jpg",@"测试2.jpg",@"测试3.jpg",@"测试4.jpg",@"测试5.jpg"]];//图片数组，可以是url，也可以是UIImage
//    
//    [self.navigationController presentViewController:jzAlbumVC animated:YES completion:nil];

    
}


-(void)buttonClick:(UIButton*)btn{
    btn.selected = !btn.selected;
    if(btn.selected){
    [btn beginSubmitting:@"提交中..."];
    }else{
    [btn endSubmitting];
    }
//    [btn sendMessageBegin:WHITEColor andChange:[UIColor orangeColor]];
//    ljjUrlWebViewController * ljjUrl = [[ljjUrlWebViewController alloc]init];
//    [self.navigationController pushViewController:ljjUrl animated:YES];

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
