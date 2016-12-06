//
//  NSString+ljjProStr.m
//  shuoyeahProject
//
//  Created by liujianji on 16/12/2.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "NSString+ljjProStr.h"

@implementation NSString (ljjProStr)
/**
 *  @brief  去除空格
 *
 *  @return 去除空格后的字符串
 */
- (NSString *)trimmingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
/**
 *  @brief  去除字符串与空行
 *
 *  @return 去除字符串与空行的字符串
 */
- (NSString *)trimmingWhitespaceAndNewlines
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
