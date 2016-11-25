//
//  HttpRequest.h
//  WorldHome
//
//  Created by yyt on 14-11-28.
//  Copyright (c) 2014年 yyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"


typedef void(^ResponsBlock)(id responseObject,BOOL isCache);
typedef NSURL *  (^  Destination)(NSURL *targetPath, NSURLResponse *response); //返回URL的Block
typedef void (^Progress)(NSProgress *  progress); // 上传或者下载进度Block
typedef void (^ DownLoadSuccess)(NSURLResponse *  response, NSURL *  filePath); // 下载成功的Blcok
typedef void (^ Success)(id responseObject); // 成功Block
typedef void (^ Failure)(NSError *error);// 失败Blcok

typedef enum : NSUInteger {
    NetTypeGet,
    NetTypePost,
    NetTypeDownload,
    NetTypeUpload
} NetType;
/**
 *  网络请求成功回调
 *
 *  @param result 字典类型返回参数
 */
typedef void(^RequstFinishBlock)(id result);
typedef void (^HttpRequestServersFinishBlock) (id result);
typedef void (^HttpRequestServersFieldBlock) (void);
/**
 *  网络请求识别
 *
 *  @param errorCode 失败code
 */
typedef void(^RequestFailedBlock)(NSInteger errorCode);

@interface HttpRequest : NSObject

/**
 *  发送get请求
 */
+ (void)getWithURL:(NSString *)url params:(NSMutableDictionary *)params success:(Success)success failure:(Failure)failure;

/**
 *  发送POST请求
 */
+ (void)postWithURL:(NSString *)url params:(NSMutableDictionary *)params success:(Success)success failure:(Failure)failure;

/**
 *  上传一张或多张图片
 */
+ (void) postImageWithURL:(NSString*)url
                   params:(NSMutableDictionary*)params
                     path:(NSString *)path
                   photos:(UIImage*)image
                  success:(Success)success
                  failure:(Failure)failure;

/**
 *  下载资源
 */
+ (NSURLSessionDownloadTask *)downLoadWithURL:(NSString *)URLString progress:(Progress)progress destination:(Destination)destination downLoadSuccess:(DownLoadSuccess)downLoadSuccess failure:(Failure)failure;

@end
