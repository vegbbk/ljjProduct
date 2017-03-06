//
//  ljjUrlWebViewController.m
//  shuoyeahProject
//
//  Created by liujianji on 16/11/21.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "ljjUrlWebViewController.h"

@interface ljjUrlWebViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView * webView;
@end

@implementation ljjUrlWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.url = @"http://www.china2wheels.com/c2w/14/index.html";
    self.view.backgroundColor = WHITEColor;
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height)];
  //  _webView.delegate = self;
    [self.view addSubview:_webView];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSURLRequest * request;
//
//    NSString * encodingString = [_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        request = [NSURLRequest requestWithURL:[NSURL URLWithString:encodingString]];
//               //回到主线程刷新UI
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //将请求加载到WebView上
//            [_webView loadRequest:request];
//            
//        });
//    });
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    NSString * path = [cachesPath stringByAppendingString:[NSString stringWithFormat:@"/Caches/%lu.html",(unsigned)[_url hash]]];
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    if (!(htmlString ==nil || [htmlString isEqualToString:@""])) {
        [_webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:_url]];
    }else{
        NSURL *url = [NSURL URLWithString:_url];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        [self writeToCache];
    }
    // Do any additional setup after loading the view.
}
/**
 * 网页缓存写入文件
 */
- (void)writeToCache
{
    NSString * htmlResponseStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:_url]encoding:NSUTF8StringEncoding error:Nil];
    //创建文件管理器
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    //获取document路径
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,      NSUserDomainMask, YES) objectAtIndex:0];
    [fileManager createDirectoryAtPath:[cachesPath stringByAppendingString:@"/Caches"]withIntermediateDirectories:YES attributes:nil error:nil];
    //写入路径
    NSString * path = [cachesPath stringByAppendingString:[NSString stringWithFormat:@"/Caches/%lu.html",(unsigned)[_url hash]]];
    
    [htmlResponseStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
//- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    
//    NSLog(@"测试是是是是是是");
//
//}

//
//-(void)dealloc{
//
// [_webView loadRequest:nil];
//}
//
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
