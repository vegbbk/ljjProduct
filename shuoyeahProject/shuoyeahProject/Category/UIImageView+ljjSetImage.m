//
//  UIImageView+ljjSetImage.m
//  shuoyeahProject
//
//  Created by liujianji on 16/11/22.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "UIImageView+ljjSetImage.h"
@implementation UIImageView (ljjSetImage)

-(void)setImageViewWithNameStr:(NSString *)nameString{

    [self sd_setImageWithURL:[NSURL URLWithString:nameString] placeholderImage:[UIImage imageNamed:defaultImgName]];
}



@end
