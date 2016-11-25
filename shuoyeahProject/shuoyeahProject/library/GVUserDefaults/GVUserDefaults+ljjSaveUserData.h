//
//  GVUserDefaults+ljjSaveUserData.h
//  shuoyeahProject
//
//  Created by liujianji on 16/11/22.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "GVUserDefaults.h"

@interface GVUserDefaults (ljjSaveUserData)
@property (nonatomic, weak) NSString *userName;
@property (nonatomic, weak) NSNumber *userId;
@property (nonatomic) NSInteger integerValue;
@property (nonatomic) BOOL boolValue;
@property (nonatomic) float floatValue;
- (NSDictionary *)setupDefaults;
@end
