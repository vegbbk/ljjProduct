//
//  UIAlertView+LJJBlock.m
//  shuoyeahProject
//
//  Created by liujianji on 16/12/8.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "UIAlertView+LJJBlock.h"
#import <objc/runtime.h>
static const char *ljjDelegateKey = "!ljjDelegateKey!";
#pragma mark - class
@interface ljjAlertViewDelegate : NSObject <UIAlertViewDelegate>
{
    //block变量
    void(^_block)();
}
//初始化的时候传入一个block
- (instancetype)initWithBlock:(void(^)())block;
@end
@implementation ljjAlertViewDelegate

- (instancetype)initWithBlock:(void(^)())block
{
    self = [super init];
    if (self) {
        //设置关联对象, 值为self
        objc_setAssociatedObject(self, ljjDelegateKey, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        _block = block;
    }
    return self;
}

#pragma mark - delegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (_block) {
        //执行block
        _block(alertView,buttonIndex);
    }
    
}
@end
@implementation UIAlertView (LJJBlock)

- (void)ljj_clickedButtonAtIndexWithBlock:(void(^)(UIAlertView *alertView,NSInteger buttonIndex))block {
    //获取delegate对象
    id delegate = objc_getAssociatedObject([[ljjAlertViewDelegate alloc] initWithBlock:block], ljjDelegateKey);
    //设置delegate为其他对象
    self.delegate = delegate;
    
}
@end
