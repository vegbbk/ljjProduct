//
//  HttpRequest.m
//  WorldHome
//
//  Created by yyt on 14-11-28.
//  Copyright (c) 2014年 yyt. All rights reserved.
//

#import "HttpRequest.h"
#import "AFURLSessionManager.h"
#import "AFHTTPSessionManager.h"
//#import "HttpClient.h"
@implementation HttpRequest
/**
 *  发送get请求
 */
+ (void)getWithURL:(NSString *)url params:(NSMutableDictionary *)params success:(Success)success failure:(Failure)failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 12;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [SVProgressHUD show];
    
    // 2.发送请求
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        //这里可以获取进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        [SVProgressHUD dismiss];
        if (success) {
             success(responseObject);
        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (failure) {
            if (![[AFNetworkReachabilityManager sharedManager] isReachable]) {
                [SVProgressHUD showErrorWithStatus:defaultFailNet];
            }
            failure(error);
        }
        
    }];
    
}

/**
 *  发送POST请求
 */

+ (void)postWithURL:(NSString *)url params:(NSMutableDictionary *)params andNeedHub:(BOOL)isYES success:(Success)success failure:(Failure)failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 12;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    // 2.加载框
    if (isYES) {
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    }
    
   //  NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithDictionary:params];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
     //这里可以获取进度
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    NSData *responseData1 = responseObject;
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseData1 options:NSJSONReadingMutableContainers error:nil];
       // [SVProgressHUD dismiss];
        if([responseDict[@"Code"]integerValue]==-400){
            [SVProgressHUD showErrorWithStatus:@"账号或密码错误"];
        }else if([responseDict[@"Code"]integerValue]==-401){
            [SVProgressHUD showErrorWithStatus:@"APP账号已被冻结"];
        }else if([responseDict[@"Code"]integerValue]==-402){
            [SVProgressHUD showErrorWithStatus:@"接口已关闭"];
        }else if([responseDict[@"Code"]integerValue]==-404){
            [SVProgressHUD showErrorWithStatus:@"接口维护中"];
        }else{
            
            if (isYES) {
                [SVProgressHUD dismiss];
            }
            if (success) {
            success(responseDict);
            }
        
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
    //[SVProgressHUD dismiss];
    if (failure) {
        if (![[AFNetworkReachabilityManager sharedManager] isReachable]) {
            [SVProgressHUD showErrorWithStatus:defaultFailNet];
            }
        failure(error);
    }

    }];
    
}

/**
 *  上传图片一张或多张
 */

+ (void) postImageWithURL:(NSString*)url
                      params:(NSMutableDictionary*)params
                        path:(NSArray *)paths
                      photos:(NSArray*)images
                     success:(Success)success
                     failure:(Failure)failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"charset=UTF-8", nil];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 请求不使用AFN默认转换,保持原有数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 响应不使用AFN默认转换,保持原有数据

    // 2.发送请求
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for(int i = 0;i<images.count;i++){
            UIImage * image = images[i];
            NSString * path = paths[i];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.1) name:path fileName:fileName mimeType:@"image/png"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //这里可以获取进度
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
        
        
    }];
    
}

/**
 *  下载
 *
 *  @param URLString       请求的链接
 *  @param progress        进度的回调
 *  @param destination     返回URL的回调
 *  @param downLoadSuccess 下载成功的回调
 *  @param failure         下载失败的回调
 */
+ (NSURLSessionDownloadTask *)downLoadWithURL:(NSString *)URLString progress:(Progress)progress destination:(Destination)destination downLoadSuccess:(DownLoadSuccess)downLoadSuccess failure:(Failure)failure;
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (progress)
        {
            progress(downloadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        if (destination)
        {
            return destination(targetPath, response);
        }
        else
        {
            return nil;
        }
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error)
        {
            failure(error);
        }
        else
        {
            downLoadSuccess(response, filePath);
        }
    }];
    
    // 开始启动任务
    [task resume];
    
    return task;
}



@end
