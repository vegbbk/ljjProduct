//
//  UIControl+zy_DelayClick.m
//  ZYCategoryDemo
//
//  Created by ripper on 16/9/20.
//  Copyright © 2016年 ripper. All rights reserved.
//

#import "UIControl+zy_DelayClick.h"
#import <objc/runtime.h>

const char *zy_delayIntervalKey = "zy_delayIntervalKey";
const char *zy_ingoreClickKey = "zy_ingoreClickKey";

@interface UIControl ()

/** 是否忽略点击事件 */
@property (nonatomic, assign) BOOL zy_ingoreClick;

@end

@implementation UIControl (zy_DelayClick)

+ (void)load
{
    Method sendAction = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method zy_sendAction = class_getInstanceMethod(self, @selector(zy_sendAction:to:forEvent:));
    method_exchangeImplementations(sendAction, zy_sendAction);
}

- (void)setZy_delayInterval:(NSTimeInterval)zy_delayInterval
{
    objc_setAssociatedObject(self, zy_delayIntervalKey, @(zy_delayInterval), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSTimeInterval)zy_delayInterval
{
    return [objc_getAssociatedObject(self, zy_delayIntervalKey) doubleValue];
}

- (void)setZy_ingoreClick:(BOOL)zy_ingoreClick
{
    objc_setAssociatedObject(self, zy_ingoreClickKey, @(zy_ingoreClick), OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (zy_ingoreClick == NO) {
        NSLog(@"Now,button can handle events");
    }
}

- (BOOL)zy_ingoreClick
{
    return [objc_getAssociatedObject(self, zy_ingoreClickKey) boolValue];
}

- (void)zy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.zy_ingoreClick) return;
    
    if (self.zy_delayInterval > 0) {
        self.zy_ingoreClick = YES;
        [self performSelector:@selector(setZy_ingoreClick:) withObject:@(NO) afterDelay:self.zy_delayInterval];
    }
    [self zy_sendAction:action to:target forEvent:event];
}

@end
