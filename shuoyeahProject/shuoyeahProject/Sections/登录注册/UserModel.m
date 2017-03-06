//
//  UserModel.m
//  shuoyeahProject
//
//  Created by liujianji on 16/12/9.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:self.name forKey:@"name"];

}

-(id)initWithCoder:(NSCoder *)aDecoder{

    if(self = [super init]){
    
        self.name = [aDecoder decodeObjectForKey:@"name"];
    
    }
    return self;
}

@end
