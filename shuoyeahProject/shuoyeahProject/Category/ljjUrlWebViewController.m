//
//  ljjUrlWebViewController.m
//  shuoyeahProject
//
//  Created by liujianji on 16/11/21.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "ljjUrlWebViewController.h"

@interface ljjUrlWebViewController ()
@property (nonatomic,strong)UIWebView * webView;
@end

@implementation ljjUrlWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.url = @"http://211.167.76.180:9988/apicenter/?audioId=fdeae346-bf4c-4508-ab3a-d1675aa9273e&userId=1aed9de8-c37b-4924-85ea-4d3f99a9b78f";
    self.view.backgroundColor = WHITEColor;
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:_webView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLRequest * request;
       
    NSString * encodingString = [_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        request = [NSURLRequest requestWithURL:[NSURL URLWithString:encodingString]];
               //回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            //将请求加载到WebView上
            [_webView loadRequest:request];
            
        });
    });

    // Do any additional setup after loading the view.
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
