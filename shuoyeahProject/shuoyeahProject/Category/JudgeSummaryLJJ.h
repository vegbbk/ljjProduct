//
//  JudgeSummaryLJJ.h
//  shuoyeahProject
//
//  Created by liujianji on 16/11/22.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AddressBook/ABAddressBook.h"
#import "EventKit/EventKit.h"
#import "AVFoundation/AVFoundation.h"
#import "AssetsLibrary/AssetsLibrary.h"
@interface JudgeSummaryLJJ : NSObject

/**
 判断手机号是否正确

 @param mobile 电话号码
 @return 空是非空不是
 */
+(NSString *)valiMobile:(NSString *)mobile;

/**
 判断身份证是否正确

 @param value 身份证号
 @return yes是no不是
 */
+ (BOOL)validateIDCardNumber:(NSString *)value;

/**
 判断邮箱是否正确

 @param email 邮箱
 @return yes是no不是
 */
+ (BOOL)isAvailableEmail:(NSString *)email;

/**
 对图片进行滤镜处理

 @param image 要处理的图片
 @param name 样式
 @return 处理完成的图片
 */
+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name;

/**
 判断字符串是否有空

 @param string <#string description#>
 @return <#return value description#>
 */
+ (BOOL)isHaceSpaceInString:(NSString *)string;

/**
 判断字符串中是否含有某个字符串

 @param string1 母
 @param string2 子
 @return 是否有
 */
+ (BOOL)isHaveString:(NSString *)string1 inString:(NSString *)string2;

/**
 判断字符串中是否含有中文

 @param string 字符串
 @return 是否有
 */
+ (BOOL)isHaveChineseInString:(NSString *)string;

/**
 判断字符串是否全部为数字

 @param string 字符串
 @return 是否有
 */
+ (BOOL)isAllNum:(NSString *)string;

/**
 定位权限是否开启
 */
- (BOOL)applicationHasAccessToLocationData;

/**
 通讯录访问权限是否开启
 */
- (BOOL)applicationhasAccessToAddressBook;

/**
 相机权限是否开启
 */
- (BOOL)applicationHasAccessToCalendar;

/**
 相册权限是否开启
 */
- (BOOL)applicationHasAccessToPhotosLibrary;


@end
