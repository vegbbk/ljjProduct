//
//  UNToast.h
//  UNToast
//
//  Created by zhangyilong on 15/9/16.
//  Copyright © 2015年 zhangyilong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UNToast;

typedef void(^UNToastCallBack)(UNToast* toast);

@interface UNToast : UIView
{
    UILabel*    title;
    NSInteger   showSeconds;
}

@property(nonatomic, copy) UNToastCallBack  callBack;

+ (UNToast*)createInView:(NSString*)title Seconds:(NSInteger)secondes;

- (void)showInView:(UIView*)view;

@end
