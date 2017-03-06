//
//  ScrollviewCell.m
//  DiSiCheng
//
//  Created by 第四城 on 15/10/22.
//  Copyright © 2015年 DiSiCheng. All rights reserved.
//

#import "ScrollviewCell.h"
#import "UIColor+HNExtensions.h"
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
@interface ScrollviewCell()
@property(nonatomic,strong)SDCycleScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIView *MyBgView;

@end

@implementation ScrollviewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

-(void)setImgUrlArray:(NSArray *)imgUrlArray{
    _imgUrlArray=imgUrlArray;
    [self loading];
}
-(void)loading{
    
    CGFloat scrollviewH=SCREEN_HEIGHT<568?120:120*SCREEN_HEIGHT/568;
    _scrollview=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, scrollviewH) imageURLStringsGroup:_imgUrlArray];
    _scrollview.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _scrollview.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _scrollview.autoScrollTimeInterval=3.0;
    _scrollview.imageURLStringsGroup = _imgUrlArray;
    _scrollview.delegate=_ScrollviewDelegate;
    _scrollview.dotColor=[UIColor colorForHexString:@"#df7251"];//小圆点的颜色
    if(_imgUrlArray.count==1){
        _scrollview.autoScroll=NO;
    }
    [self.MyBgView addSubview:_scrollview];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
