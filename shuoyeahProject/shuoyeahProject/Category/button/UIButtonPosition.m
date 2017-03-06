//
//  UIButtonPosition.m
//  shuoyeahProject
//
//  Created by liujianji on 16/12/21.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "UIButtonPosition.h"

@implementation UIButtonPosition


- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [super titleRectForContentRect:contentRect];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [super imageRectForContentRect:contentRect];
}


@end
