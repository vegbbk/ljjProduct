//
//  UIAlertView+LJJBlock.h
//  shuoyeahProject
//
//  Created by liujianji on 16/12/8.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (LJJBlock)
- (void)ljj_clickedButtonAtIndexWithBlock:(void(^)(UIAlertView *alertView,NSInteger buttonIndex))block;
@end
