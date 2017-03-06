//
//  testSliderViewController.m
//  shuoyeahProject
//
//  Created by liujianji on 16/12/1.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "testSliderViewController.h"

@interface testSliderViewController (){

    UIImageView * imageView;

}

@end

@implementation testSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ceshi1";
    self.view.backgroundColor = WHITEColor;
    [self createAnimations];
    // Do any additional setup after loading the view.
}
#pragma mark -------------------------------------------------------------------------------------
- (void)createAnimations{

  //  UIButton * button = [myLjjTools creat]
    
//    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(80, 100, 120, 120)];
//    
//    imageView.image = [UIImage imageNamed:@"测试4.jpg"];
//    
//    [self.view addSubview:imageView];
//
//    imageView.image = [JudgeSummaryLJJ filterWithOriginalImage:imageView.image filterName:@"CIPhotoEffectProcess"];
//    
//    [UIView animateWithDuration:1 animations:^{
//        imageView.alpha = 0.3;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1 animations:^{
//            imageView.alpha = 1;
//        }];
//        
//    }];
    UIView * greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIView * redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView * blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(10);
        make.top.equalTo(self.view.mas_top).offset(10);
        make.bottom.equalTo(blueView.mas_top).offset(-10);
        make.right.equalTo(redView.mas_left).offset(-10);
//        make.width.equalTo(redView.mas_width);
//        make.height.equalTo(redView.mas_height);
//        make.height.equalTo(blueView.mas_height).multipliedBy(0.5);
        
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(10);
     //   make.left.equalTo(greenView.mas_right).offset(10);
        make.width.equalTo(greenView.mas_width);
        make.height.equalTo(greenView.mas_height);
        make.right.equalTo(self.view.mas_right).offset(-10);
        
    }];

    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(10);
        make.height.equalTo(greenView.mas_height).multipliedBy(1.0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-300);
        make.right.equalTo(self.view.mas_right).offset(-10);
        
    }];

    textFieldLJJView * ljjView = [[textFieldLJJView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(blueView.frame)+10, SCREEN_WIDTH-60, 50)];
    ljjView.nameLabelStr = @"测试测试";
    ljjView.placeHolder = @"联系人";
    ljjView.headImageName = @"测试2";
    ljjView.layer.borderWidth = 1;
    ljjView.layer.borderColor = [UIColor purpleColor].CGColor;
    [self.view addSubview:ljjView];
    
       
    
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
