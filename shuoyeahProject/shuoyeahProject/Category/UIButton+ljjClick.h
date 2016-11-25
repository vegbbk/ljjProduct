//
//  UIButton+ljjClick.h
//  shuoyeahProject
//
//  Created by liujianji on 16/11/22.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ljjClick)

/**
 倒计时按钮

 @param beginColor 按钮初始颜色
 @param changeColor 倒计时背景色
 */
- (void)sendMessageBegin:(UIColor*)beginColor andChange:(UIColor*)changeColor;
@end
