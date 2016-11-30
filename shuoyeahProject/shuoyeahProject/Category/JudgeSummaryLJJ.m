//
//  JudgeSummaryLJJ.m
//  shuoyeahProject
//
//  Created by liujianji on 16/11/22.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "JudgeSummaryLJJ.h"
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>

@implementation JudgeSummaryLJJ
//判断手机号码格式是否正确
+(NSString *)valiMobile:(NSString *)mobile{
    if (mobile.length < 11)
    {
        //        NSLog(@"手机号长度只能是11位");
        return @"手机号长度只能是11位";
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        /**
         *  座机号码
         */
        NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        NSPredicate *pred4 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
        BOOL isMatch4 = [pred4 evaluateWithObject:mobile];
        
        
        if (isMatch1 || isMatch2 || isMatch3 || isMatch4) {
            NSLog(@"是电话号码");
            return @"";
        }else{
            NSLog(@"请输入正确的电话号码");
            return @"请输入正确的电话号码";
        }
    }
    return @"";
}

+ (BOOL)validateIDCardNumber:(NSString *)value {
    
    BOOL flag;
    if (value.length <= 0)
    {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:value];
    
    
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag)
    {
        if(value.length==18)
        {
            //将前17位加权因子保存在数组里
            NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
            
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            
            //用来保存前17位各自乖以加权因子后的总和
            
            NSInteger idCardWiSum = 0;
            for(int i = 0;i < 17;i++)
            {
                NSInteger subStrIndex = [[value substringWithRange:NSMakeRange(i, 1)] integerValue];
                NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                
                idCardWiSum+= subStrIndex * idCardWiIndex;
                
            }
            
            //计算出校验码所在数组的位置
            NSInteger idCardMod=idCardWiSum%11;
            
            //得到最后一位身份证号码
            NSString * idCardLast= [value substringWithRange:NSMakeRange(17, 1)];
            
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if(idCardMod==2)
            {
                if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
                {
                    return flag;
                }else
                {
                    flag =  NO;
                    return flag;
                }
            }else
            {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
                {
                    return flag;
                }
                else
                {
                    flag =  NO;
                    return flag;
                }
            }
        }
        else
        {
            flag =  NO;
            return flag;
        }
    }
    else
    {
        return flag;
    }
}
//判断邮箱格式是否正确
+ (BOOL)isAvailableEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
#pragma mark -- 对图片进行滤镜处理
//name支持如下：
//怀旧-->CIPhotoEffectInstant
//单色-->CIPhotoEffectMono
//黑白-->CIPhotoEffectNoir
//褪色-->CIPhotoEffectFade
//色调-->CIPhotoEffectTonal
//冲印-->CIPhotoEffectProcess
//岁月-->CIPhotoEffectTransfer
//铬黄-->CIPhotoEffectMono
+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name{
    CIContext* context = [CIContext contextWithOptions:nil];
    CIImage* inputImage = [[CIImage alloc]initWithImage:image];
    //创建滤镜
    CIFilter* filter = [CIFilter filterWithName:name];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    CIImage* result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage* resultImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return resultImage;
}
//判断字符串中是否含有空格
+ (BOOL)isHaceSpaceInString:(NSString *)string{
    NSRange _range = [string rangeOfString:@" "];
    if (_range.location != NSNotFound) {
        return YES;
    }
    return NO;
}

//判断字符串中是否含有某个字符串
+ (BOOL)isHaveString:(NSString *)string1 inString:(NSString *)string2{
    NSRange _range = [string2 rangeOfString:string1];
    if (_range.location != NSNotFound) {
        return YES;
    }
    return NO;
}
//判断字符串中是否含有中文
+ (BOOL)isHaveChineseInString:(NSString *)string{
    for (NSInteger i = 0; i < [string length]; i ++) {
        int a = [string characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}
//判断字符串是否全部为数字
+ (BOOL)isAllNum:(NSString *)string{
    unichar c;
    for (int i = 0; i < [string length]; i ++) {
        c = [string characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)applicationHasAccessToLocationData
{
    
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusRestricted||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied) {
        return NO;
    }
#if __IPHONE_8_0
#else
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorized)
        return YES;
#endif
    
    return NO;
}

- (BOOL)applicationhasAccessToAddressBook
{
    BOOL hasAccess = NO;
#if __IPHONE_9_0
    if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts]==CNAuthorizationStatusAuthorized) {
        hasAccess=YES;
        
    }
#else
    switch (ABAddressBookGetAuthorizationStatus())
    {
        case kABAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
#endif
    
    return hasAccess;
}
- (BOOL)applicationHasAccessToCalendar
{
    
    BOOL hasAccess = NO;
    
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent])
    {
        case EKAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
    
    return hasAccess;
}

- (BOOL)applicationHasAccessToPhotosLibrary
{
    BOOL hasAccess = NO;
    
#if __IPHONE_8_0
    int author = [PHPhotoLibrary authorizationStatus];
    if (author==PHAuthorizationStatusAuthorized) {
        hasAccess=YES;
    }
    
#else
    int author = [ALAssetsLibrary authorizationStatus];
    if(author== ALAuthorizationStatusAuthorized)
    {
        hasAccess=YES;
    }
#endif
    return hasAccess;
}

@end
