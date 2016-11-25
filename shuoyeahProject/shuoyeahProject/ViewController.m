//
//  ViewController.m
//  shuoyeahProject
//
//  Created by shuoyeah on 16/7/27.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    
//    if ([key isEqualToString:@"id"]) {
//        self.userid = value;
//    }
//    
//}
//
//- (instancetype)valueForUndefinedKey:(NSString *)key{
//    return nil;
//}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

- (instancetype)valueForUndefinedKey:(NSString *)key{
    return nil;
}

//NSString *ID = @"liveViewControllercell1";
//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//if (cell == nil) {
//    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    
//}
//return cell;

//UIButton *releaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//releaseButton.frame = CGRectMake(0, 0, 80, 30);
//[releaseButton setTitle:@"下一步" forState:normal];
//[releaseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//releaseButton.layer.cornerRadius = 3;
//[releaseButton setBackgroundColor:[UIColor orangeColor]];
//[releaseButton addTarget:self action:@selector(releaseInfo) forControlEvents:UIControlEventTouchUpInside];
//UIBarButtonItem *releaseButtonItem = [[UIBarButtonItem alloc] initWithCustomView:releaseButton];
//self.navigationItem.rightBarButtonItem = releaseButtonItem;
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
}
//-(void)sureAdd{
//    NSArray * ctrlArray = self.navigationController.viewControllers;
//    for (UIViewController *vc in ctrlArray) {
//        if ([vc isKindOfClass:[addShopViewController class]]) {
//            [self.navigationController popToViewController:vc animated:YES];
//        }
//    }
//}
//[[NSNotificationCenter defaultCenter] postNotificationName:@"keshi" object:nil userInfo:@{@"keshi":model.dname,@"keshiID":model.did}];
//[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userid:) name:@"zhicheng" object:nil];
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
