//
//  ScrollviewCell.h
//  DiSiCheng
//
//  Created by 第四城 on 15/10/22.
//  Copyright © 2015年 DiSiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface ScrollviewCell : UITableViewCell
@property(nonatomic,strong)NSArray *imgUrlArray;
@property(nonatomic,weak)id<SDCycleScrollViewDelegate> ScrollviewDelegate;

@property(nonatomic,assign)BOOL isLoad;
-(void)loading;

@property(nonatomic,strong)NSArray *bannerArray;


@end
