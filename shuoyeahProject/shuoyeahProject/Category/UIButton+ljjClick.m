//
//  UIButton+ljjClick.m
//  shuoyeahProject
//
//  Created by liujianji on 16/11/22.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "UIButton+ljjClick.h"

@implementation UIButton (ljjClick)


- (void)sendMessageBegin:(UIColor*)beginColor andChange:(UIColor*)changeColor{
        __block int timeout=60;
        //倒计时时间
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue); dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
        //每秒执行
        dispatch_source_set_event_handler(_timer, ^{
            if(timeout<=0){
                //倒计时结束，关闭
                dispatch_source_cancel(_timer); dispatch_async(dispatch_get_main_queue(), ^{
                    // 设置界面的按钮显示 根据自己需求设置
                    [self setTitle:@"发送验证码" forState:UIControlStateNormal];
                    self.userInteractionEnabled = YES;
                    [self setBackgroundColor:beginColor];
                });
            }else{
                int seconds = timeout % 60;
                NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
                if ([strTime isEqualToString:@"0"]) {
                    strTime = [NSString stringWithFormat:@"%d",60];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    //设置界面的按钮显示 根据自己需求设置
                    //NSLog(@"____%@",strTime);
                    [UIView beginAnimations:nil context:nil];
                    [UIView setAnimationDuration:1]; 
                    [self setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                    [UIView commitAnimations]; 
                    self.userInteractionEnabled = NO;
                    [self setBackgroundColor:changeColor];
                });
                timeout--;
            } 
        }); 
        dispatch_resume(_timer);
}
@end
