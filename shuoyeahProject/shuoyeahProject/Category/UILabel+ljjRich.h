//
//  UILabel+ljjRich.h
//  shuoyeahProject
//
//  Created by shuoyeah on 16/11/17.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^tapLabeBlock)();

@interface UILabel (ljjRich)

//@property (copy, nonatomic) tapLabeBlock block;

/**
 变换字符串颜色

 @param string 需要改变颜色的字符串
 @param color 改变的颜色
 */
-(void)createLabelTextWithChangeColorTxt:(NSString *)string withColor:(UIColor *)color;

/**
 为label添加点击

 @param isPass 是否添加
 @param block 回调点击事件
 */
-(void)addTapGuester:(BOOL)isPass with:(tapLabeBlock)block;
@end
