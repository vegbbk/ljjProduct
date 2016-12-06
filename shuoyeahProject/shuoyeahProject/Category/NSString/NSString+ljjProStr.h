//
//  NSString+ljjProStr.h
//  shuoyeahProject
//
//  Created by liujianji on 16/12/2.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ljjProStr)
/**
 *  @brief  去除空格
 *
 *  @return 去除空格后的字符串
 */
- (NSString *)trimmingWhitespace;
/**
 *  @brief  去除字符串与空行
 *
 *  @return 去除字符串与空行的字符串
 */
- (NSString *)trimmingWhitespaceAndNewlines;

@end
