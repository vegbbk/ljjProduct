//
//  welcomePageViewController.m
//  shuoyeahProject
//
//  Created by shuoyeah on 16/11/9.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "welcomePageViewController.h"
#define MainScreen_width  [UIScreen mainScreen].bounds.size.width//宽
#define MainScreen_height [UIScreen mainScreen].bounds.size.height//高
#import "GWNavC.h"
#import "loginViewController.h"
#import "baseTabBarViewController.h"
@interface welcomePageViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *bigScrollView;
@property(nonatomic)NSArray *imageArray;
@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation welcomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageArray = @[@"测试1.jpg",@"测试2.jpg",@"测试3.jpg"];
    self.navigationController.navigationBarHidden = YES;
    [self loadPageView];

    // Do any additional setup after loading the view.
}
-(void)loadPageView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, MainScreen_width, MainScreen_height)];
    
    scrollView.contentSize = CGSizeMake((_imageArray.count + 1)*MainScreen_width, MainScreen_height);
    //设置反野效果，不允许反弹，不显示水平滑动条，设置代理为自己
    scrollView.pagingEnabled = YES;//设置分页
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    _bigScrollView = scrollView;
    
    for (int i = 0; i < _imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(i * MainScreen_width, 0, MainScreen_width, MainScreen_height);
        UIImage *image = [UIImage imageNamed:_imageArray[i]];
        imageView.image = image;
        
        [scrollView addSubview:imageView];
        if(i==_imageArray.count-1){
        
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i * MainScreen_width+(MainScreen_width-90)/2, MainScreen_height - 90, 90, 35);
            button.layer.cornerRadius = 3.0;
            button.layer.borderColor = WHITEColor.CGColor;
            button.layer.borderWidth = 1;
            [button setTitle:@"立即体验" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(experienceClick) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:button];
            
        }
    }
    
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(MainScreen_width/2, MainScreen_height - 50, 0, 40)];
    pageControl.numberOfPages = _imageArray.count;
    pageControl.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pageControl];
    
    _pageControl = pageControl;
    
    //添加手势
    UITapGestureRecognizer *singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTapFrom)];
    singleRecognizer.numberOfTapsRequired = 1;
    [scrollView addGestureRecognizer:singleRecognizer];
}


-(void)experienceClick{

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunch"]) {
        
        loginViewController  * tab = [[loginViewController alloc]init];
        GWNavC * nav = [[GWNavC alloc]initWithRootViewController:tab];
        self.view.window.rootViewController = nav;
        
    }else{
        
        baseTabBarViewController * tab = [[baseTabBarViewController alloc]init];
        self.view.window.rootViewController = tab;
        
    }
    NSUserDefaults* userDefaultsss = [NSUserDefaults standardUserDefaults];
    [userDefaultsss setBool:YES forKey:@"firstLaunched"];
    [userDefaultsss synchronize];


}

-(void)handleSingleTapFrom
{
    if (_pageControl.currentPage == self.imageArray.count-1) {
        //[self removeFromSuperview];
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunch"]) {
            
            loginViewController  * tab = [[loginViewController alloc]init];
            GWNavC * nav = [[GWNavC alloc]initWithRootViewController:tab];
            self.view.window.rootViewController = nav;
            
        }else{
            
            baseTabBarViewController * tab = [[baseTabBarViewController alloc]init];
            self.view.window.rootViewController = tab;
            
        }
        NSUserDefaults* userDefaultsss = [NSUserDefaults standardUserDefaults];
        [userDefaultsss setBool:YES forKey:@"firstLaunched"];
        [userDefaultsss synchronize];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _bigScrollView) {
        CGPoint offSet = scrollView.contentOffset;
        _pageControl.currentPage = offSet.x/(self.view.bounds.size.width);//计算当前的页码
        [scrollView setContentOffset:CGPointMake(self.view.bounds.size.width * (_pageControl.currentPage), scrollView.contentOffset.y) animated:YES];
    }
    if (scrollView.contentOffset.x == (_imageArray.count) *MainScreen_width) {
        //   [self removeFromSuperview];
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunch"]) {
            
            loginViewController  * tab = [[loginViewController alloc]init];
            GWNavC * nav = [[GWNavC alloc]initWithRootViewController:tab];
            self.view.window.rootViewController = nav;
            
        }else{
            
            baseTabBarViewController * tab = [[baseTabBarViewController alloc]init];
            self.view.window.rootViewController = tab;
            
        }
        NSUserDefaults* userDefaultsss = [NSUserDefaults standardUserDefaults];
        [userDefaultsss setBool:YES forKey:@"firstLaunched"];
        [userDefaultsss synchronize];
    }
}

-(void)dealloc{

    _bigScrollView.delegate = nil;

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
