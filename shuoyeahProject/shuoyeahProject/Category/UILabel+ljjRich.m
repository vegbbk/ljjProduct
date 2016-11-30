//
//  UILabel+ljjRich.m
//  shuoyeahProject
//
//  Created by shuoyeah on 16/11/17.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "UILabel+ljjRich.h"
static const void *jk_UIButtonBlockKey = &jk_UIButtonBlockKey;
@implementation UILabel (ljjRich)
-(void)createLabelTextWithChangeColorTxt:(NSString *)string withColor:(UIColor *)color{

    NSString *str1 = self.text;
    NSRange range = [str1 rangeOfString:string];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:str1];
    //设置单位长度内的内容显示成色
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:range];
    self.attributedText = str;
    //下划线
//    NSMutableAttributedString *str=(NSMutableAttributedString*)self.attributedText;
//    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
//    self.attributedText=str;

}

-(void)addTapGuester:(BOOL)isPass with:(tapLabeBlock)block{
    //self.block = [block copy];
    objc_setAssociatedObject(self, jk_UIButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if(isPass){
        self.userInteractionEnabled = YES;
    
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick)];
        [self addGestureRecognizer:tap];
    }

}

-(void)labelClick{

    tapLabeBlock block = objc_getAssociatedObject(self, jk_UIButtonBlockKey);
    if (block) {
        block();
    }

}

@end
