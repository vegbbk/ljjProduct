//
//  textFieldLJJView.m
//  shuoyeahProject
//
//  Created by liujianji on 17/1/12.
//  Copyright © 2017年 shuoyeah. All rights reserved.
//

#import "textFieldLJJView.h"
#define labelToView  10
#define labelToViewTop 10
#define ImageToView 5

@implementation textFieldLJJView{

    UITextField * textField;
    UIImageView * imageView;
    UILabel * Namelabel;
}


-(instancetype)initWithFrame:(CGRect)frame{

    if(self = [super initWithFrame:frame]){
      
        imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
        
        Namelabel = [[UILabel alloc]init];
        Namelabel.textColor = BlackColor;
        Namelabel.textAlignment = NSTextAlignmentCenter;
        Namelabel.font = FontSize(FONTONE);
        [self addSubview:Namelabel];
        
        textField = [[UITextField alloc]init];
        textField.font = FontSize(FONTONE);
        [self addSubview:textField];
    
    }

    return self;
}


- (void)layoutSubviews{

    [super layoutSubviews];
      Namelabel.text = _nameLabelStr;
     textField.placeholder = _placeHolder;
    imageView.image = [UIImage imageNamed:_headImageName];
     CGSize titleSize = [_nameLabelStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:FontSize(FONTONE)} context:nil].size;
    if(_headImageName){
        imageView.frame = CGRectMake(ImageToView, labelToViewTop,  self.frame.size.height-2*labelToViewTop,  self.frame.size.height-2*labelToViewTop);
        textField.frame = CGRectMake(CGRectGetMaxX(imageView.frame)+6, labelToViewTop, self.frame.size.width-CGRectGetMaxX(imageView.frame)-6, self.frame.size.height-2*labelToViewTop);
    }else{
    Namelabel.frame = CGRectMake(labelToView, labelToViewTop, titleSize.width+6, self.frame.size.height-2*labelToViewTop);
    textField.frame = CGRectMake(CGRectGetMaxX(Namelabel.frame), labelToViewTop, self.frame.size.width-CGRectGetMaxX(Namelabel.frame)-4, self.frame.size.height-2*labelToViewTop);
    }
    
}

//-(void)setNameLabelStr:(NSString *)nameLabelStr{
//
//    self.nameLabelStr = nameLabelStr;
//    Namelabel.text = nameLabelStr;
//
//}
//
//-(void)setPlaceHolder:(NSString *)placeHolder{
//
//    self.placeHolder = placeHolder;
//    textField.placeholder = placeHolder;
//    
//}



@end
