//
//  myLjjTools.m
//  myBase
//
//  Created by shuoyeah on 16/5/25.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "myLjjTools.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@implementation myLjjTools
/*
 ===============================================================
 按钮
 ===============================================================
 */
+ (UIButton *)createButtonWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andBgColor:(UIColor *)bgColor andImage:(UIImage *)image andBgImage:(UIImage *)bgImage andSelecter:(SEL)sel andTarget:(id)target
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }if (titleFont) {
        [btn.titleLabel setFont:titleFont];
    }
    if (bgColor) {
        [btn setBackgroundColor:bgColor];
    }
    if (rect.size.width) {
        btn.frame = rect;
    }
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    if (bgImage) {
        [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
    if (sel) {
        [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

+ (UIButton *)createButtonWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andBgColor:(UIColor *)bgColor andImage:(UIImage *)image andBgImage:(UIImage *)bgImage andSelecter:(SEL)sel andTarget:(id)target andCornerRadius:(CGFloat)corner

{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }if (titleFont) {
        [btn.titleLabel setFont:titleFont];
    }
    if (bgColor) {
        [btn setBackgroundColor:bgColor];
    }
    if (rect.size.width) {
        btn.frame = rect;
    }
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    if (bgImage) {
        [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
    if (sel) {
        [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    if (corner) {
        [btn.layer setCornerRadius:corner];
        [btn.layer setMasksToBounds:YES];
    }
    return btn;
}

+ (UIButton *)createButtonWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andBgColor:(UIColor *)bgColor andImage:(UIImage *)image andBgImage:(UIImage *)bgImage andSelecter:(SEL)sel andTarget:(id)target andforState:(UIControlState)state andStateTitle:(NSString *)stateTitle andStateTitleColor:(UIColor *)stateTitleColor andStateImage:(UIImage *)stateImage andStateBgImage:(UIImage *)stateBgImage andCornerRadius:(CGFloat)corner
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (titleFont) {
        [btn.titleLabel setFont:titleFont];
    }
    if (bgColor) {
        [btn setBackgroundColor:bgColor];
    }
    if (rect.size.width) {
        btn.frame = rect;
    }
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    if (bgImage) {
        [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
    if (stateTitle) {
        [btn setTitle:stateTitle forState:state];
    }
    if (stateTitleColor) {
        [btn setTitleColor:stateTitleColor forState:state];
    }
    if (stateImage) {
        [btn setImage:image forState:state];
    }
    if (stateBgImage) {
        [btn setBackgroundImage:bgImage forState:state];
    }
    
    if (sel) {
        [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    if (corner) {
        [btn.layer setCornerRadius:corner];
        [btn.layer setMasksToBounds:YES];
    }
    return btn;
}

+ (UIButton *)createButtonWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andBgColor:(UIColor *)bgColor  andSelecter:(SEL)sel andTarget:(id)target andCornerRadius:(CGFloat)corner
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (titleFont) {
        [btn.titleLabel setFont:titleFont];
    }
    if (bgColor) {
        [btn setBackgroundColor:bgColor];
    }
    if (rect.size.width) {
        btn.frame = rect;
    }
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (sel) {
        [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    if (corner) {
        [btn.layer setCornerRadius:corner];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setShouldRasterize:YES];
        btn.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return btn;
}

/*
 ===================================================================
 label
 ===================================================================
 */
+(UILabel *)createLabelWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andTextAlignment:(NSTextAlignment)alignment  andBgColor:(UIColor *)bgColor{
    
    UILabel * label = [[UILabel alloc]init];
    if (rect.size.width) {
        label.frame = rect;
    }
    if (title) {
        label.text = title;
    }
    if (titleColor) {
        label.textColor = titleColor;
    }
    if (titleFont) {
        label.font = titleFont;
    }
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    if (alignment) {
        label.textAlignment = alignment;
    }
    return label;
}


+(UILabel *)createLabelWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andTextAlignment:(NSTextAlignment)alignment  andBgColor:(UIColor *)bgColor andLines:(NSInteger)numberOfLines andAdjustsFontSizeToFiWidth:(BOOL)sizeBool{
    
    UILabel * label = [[UILabel alloc]init];
    
    if (rect.size.width) {
        label.frame = rect;
    }
    if (title) {
        label.text = title;
    }
    if (titleColor) {
        label.textColor = titleColor;
    }
    if (titleFont) {
        label.font = titleFont;
    }
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    if (alignment) {
        label.textAlignment = alignment;
    }
    if (numberOfLines) {
        label.numberOfLines = numberOfLines;
    }
    if (sizeBool) {
        label.adjustsFontSizeToFitWidth = sizeBool;
        [label sizeToFit];
    }
    return label;
}

+(UILabel *)createLabelWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andTextAlignment:(NSTextAlignment)alignment  andBgColor:(UIColor *)bgColor andCGSizeWIDTH:(CGFloat )width{
    
    UILabel * label = [[UILabel alloc]init];
    if (rect.size.width) {
        label.frame = rect;
    }
    if (title) {
        label.text = title;
    }
    if (titleColor) {
        label.textColor = titleColor;
    }
    if (titleFont) {
        label.font = titleFont;
    }
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    if (alignment) {
        label.textAlignment = alignment;
    }
    if (width) {
        NSDictionary *fontDic = @{NSFontAttributeName:titleFont};
        CGRect labelRect = [title boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDic context:nil];
        CGSize size = labelRect.size;
        label.numberOfLines = 0;
        rect.size.height = size.height;
        label.frame = rect;
        label.font = titleFont;
    }
    return label;
}

/*
 ===============================================================
 VIEW
 ===============================================================
 */
+(UIView *)createViewWithFrame:(CGRect)rect andBgColor:(UIColor *)bgColor{
    
    UIView * view = [[UIView alloc]init];
    if (rect.size.width) {
        view.frame = rect;
    }
    if (bgColor) {
        view.backgroundColor = bgColor;
    }
    
    return view;
}


+(UIView *)createViewWithFrame:(CGRect)rect andBgColor:(UIColor *)bgColor andCornerRaduis:(CGFloat)corner andBorderWidth:(CGFloat)border andBorderColor:(UIColor *)bdColor shadowColor:(UIColor *)shadowColor andShadowOffset:(CGSize)offset andShadowOpacity:(float)opacity andShadowRadius:(CGFloat)radius{
    
    UIView * view = [[UIView alloc]init];
    if (rect.size.width) {
        view.frame = rect;
    }
    if (bgColor) {
        view.backgroundColor = bgColor;
    }
    if (corner) {
        view.layer.cornerRadius = corner;
    }
    if (border) {
        view.layer.borderWidth = border;
    }
    if (bdColor) {
        view.layer.borderColor = bdColor.CGColor;
    }
    if (shadowColor) {
        //设置阴影颜色
        view.layer.shadowColor = shadowColor.CGColor;
    }
    if (offset.width || offset.height) {
        //设置阴影移动角度
        view.layer.shadowOffset = offset;
    }
    if (opacity) {
        //设置阴影透明度，默认完全透明
        view.layer.shadowOpacity = opacity;
    }
    if (radius) {
        //设置阴影虚化角度
        view.layer.shadowRadius = radius;
    }
    
    return view;
}

/*
 ===============================================================
 图片
 ===============================================================
 */
+(UIImageView *)createImageViewWithFrame:(CGRect)rect andImage:(UIImage *)image andBgColor:(UIColor *)bgColor{
    
    UIImageView * imageView = [[UIImageView alloc] init];
    if (rect.size.width) {
        imageView.frame = rect;
    }
    if (image) {
        imageView.image = image;
    }
    if (bgColor) {
        imageView.backgroundColor = bgColor;
    }
    
    return imageView;
}

+(UIImageView *)createImageViewWithFrame:(CGRect)rect andImageResource:(NSString *)imageResource andImageType:(NSString *)typpe andBgColor:(UIColor *)bgColor{
    
    UIImageView * imageView = [[UIImageView alloc] init];
    if (rect.size.width) {
        imageView.frame = rect;
    }
    if (imageResource) {
        //获得路径
        NSString * path = [[NSBundle mainBundle]pathForResource:imageResource ofType:typpe];
        imageView.image = [UIImage imageWithContentsOfFile:path];
    }
    if (bgColor) {
        imageView.backgroundColor = bgColor;
    }
    
    return imageView;
}

+(UIImageView *)createImageViewWithFrame:(CGRect)rect andImageName:(NSString *)imageName andBgColor:(UIColor *)bgColor{
    
    UIImageView * imageView = [[UIImageView alloc] init];
    if (rect.size.width) {
        imageView.frame = rect;
    }
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    if (bgColor) {
        imageView.backgroundColor = bgColor;
    }
    
    return imageView;
}
/*
 ===============================================================
 输入框
 ===============================================================
 */
+(UITextField *)createTextFieldFrame:(CGRect)rect andBgColor:(UIColor *)bgColor andPlaceholder:(NSString *)placeholder andTextColor:(UIColor *)textColor andTextFont:(UIFont * )font andTextAlignment:(NSTextAlignment)alignment andSecureText:(BOOL)secure andBorderStyle:(UITextBorderStyle)borderStyle andReturnType:(UIReturnKeyType)returnType andClearButtonMode:(UITextFieldViewMode)buttonMode{
    
    UITextField *textField = [[UITextField alloc]init];
    if (rect.size.width) {
        textField.frame = rect;
    }
    if (bgColor) {
        textField.backgroundColor = bgColor;
    }
    if (placeholder) {//提示文字
        textField.placeholder = placeholder;
    }
    if (textColor) {
        textField.textColor = textColor;
    }
    if (font) {
        textField.font = font;
    }
    if (alignment) {//左右
        textField.textAlignment = alignment;
    }
    if (secure) {//密文是否开启
        textField.secureTextEntry = secure;
    }
    if (borderStyle) {  //设置边框
        textField.borderStyle = borderStyle;
    }
    if (returnType) {//设置右下角return键的格式
        textField.returnKeyType = returnType;
    }
    if (buttonMode){//设置清除按钮
        textField.clearButtonMode = buttonMode;
    }
    
    [textField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [textField setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    return textField;
    
}
+(UITextField *)createTextFieldFrame:(CGRect)rect andBgColor:(UIColor *)bgColor andPlaceholder:(NSString *)placeholder andTextColor:(UIColor *)textColor andTextFont:(UIFont * )font andReturnType:(UIReturnKeyType)returnType{
    
    UITextField *textField = [[UITextField alloc]init];
    if (rect.size.width) {
        textField.frame = rect;
    }
    if (bgColor) {
        textField.backgroundColor = bgColor;
    }
    if (placeholder) {//提示文字
        textField.placeholder = placeholder;
    }
    if (textColor) {
        textField.textColor = textColor;
    }
    if (font) {
        textField.font = font;
    }
//    textField.layer.borderWidth = 1;
//    textField.layer.borderColor = lineColor.CGColor;
//    textField.layer.cornerRadius = 3.0;
    if (returnType) {//设置右下角return键的格式
        textField.returnKeyType = returnType;
    }
    
   // [textField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:font forKeyPath:@"_placeholderLabel.font"];
    return textField;
    
}

+(UIBarButtonItem *)createButtonItemWith:(UIView *)customView{


    UIBarButtonItem *ButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];

    return ButtonItem;

}

+(UILabel *)createLabelTextWithView:(UILabel *)label andwithChangeColorTxt:(NSString *)string withColor:(UIColor *)color{

    NSString *str1 = label.text;
    NSRange range = [str1 rangeOfString:string];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:str1];
    //设置单位长度内的内容显示成色
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    label.attributedText = str;
    return label;
}

+(CGSize)countTxtWith:(NSString *)text andWithFont:(UIFont *)font with:(CGFloat)width{

    CGSize size ;

    size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;

    return size;
}
//RGB颜色转换
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}
//压缩图片

+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    //创建一个图形上下文形象
    UIGraphicsBeginImageContext(newSize);
    // 告诉旧图片画在这个新的环境,所需的
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    //获取上下文的新形象
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}

+(UIAlertView *)alertControllerWithTitle:(NSString *)Title  message:(NSString *)message trueTitle:(NSString *)trTitle  cancelTitle:(NSString *)cancle delac:(id)ss{
    
           if (!cancle.length) {
            cancle = nil;
        }
        
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:Title message:message delegate:ss cancelButtonTitle:trTitle otherButtonTitles:cancle, nil];
        [alertView show];
        return alertView;
}

+ (NSMutableArray *)getMyPhoneBook
{
    NSMutableArray * peopleArr = [NSMutableArray array];
    //新建一个通讯录类
    ABAddressBookRef addressBooks = nil;
    
    addressBooks =  ABAddressBookCreateWithOptions(NULL, NULL);
    //获取通讯录权限
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    ABAddressBookRequestAccessWithCompletion(addressBooks, ^(bool granted, CFErrorRef error){
        dispatch_semaphore_signal(sema);
    });
    
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    if (ABAddressBookGetAuthorizationStatus() != kABAuthorizationStatusAuthorized) {
        return nil;
    }
    
    //获取通讯录中的所有人
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBooks);
    //通讯录中人数
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBooks);
    
    //循环，获取每个人的个人信息
    for (NSInteger i = 0; i < nPeople; i++) {
        NSMutableDictionary * dict = [NSMutableDictionary dictionary];//存储每个联系人信息
        
        NSMutableDictionary * dicti = [NSMutableDictionary dictionary];
        NSMutableArray * phoneNum = [NSMutableArray array];//一个联系人电话
        //获取个人
        ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
        //获取个人名字
        CFTypeRef abName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
        CFTypeRef abLastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
        CFStringRef abFullName = ABRecordCopyCompositeName(person);
        NSString *nameString = (__bridge NSString *)abName;
        NSString *lastNameString = (__bridge NSString *)abLastName;
        if ((__bridge id)abFullName != nil) {
            nameString = (__bridge NSString *)abFullName;
        }
        else {
            if ((__bridge id)abLastName != nil) {
                nameString = [NSString stringWithFormat:@"%@ %@", nameString, lastNameString];
            }
        }
        [dict setValue:nameString forKey:@"name"];
        ABPropertyID multiProperties[] = {
            kABPersonPhoneProperty,
            kABPersonEmailProperty
        };
        NSInteger multiPropertiesTotal = sizeof(multiProperties) / sizeof(ABPropertyID);
        for (NSInteger j = 0; j < multiPropertiesTotal; j++) {
            ABPropertyID property = multiProperties[j];
            ABMultiValueRef valuesRef = ABRecordCopyValue(person, property);
            NSInteger valuesCount = 0;
            if (valuesRef != nil) valuesCount = ABMultiValueGetCount(valuesRef);
            
            if (valuesCount == 0) {
                CFRelease(valuesRef);
                continue;
            }
            //获取电话号码和email
            for (NSInteger k = 0; k < valuesCount; k++) {
                CFTypeRef value = ABMultiValueCopyValueAtIndex(valuesRef, k);
                switch (j) {
                    case 0: {// Phone number
                        NSString *tel = (__bridge NSString*)value;
                        
                        //以下5行请勿删除,请勿修改,隐形代码,删改后果自负
                        tel = [tel stringByReplacingOccurrencesOfString:@"(" withString:@""];
                        tel = [tel stringByReplacingOccurrencesOfString:@")" withString:@""];
                        tel = [tel stringByReplacingOccurrencesOfString:@"-" withString:@""];
                        tel = [tel stringByReplacingOccurrencesOfString:@" " withString:@""];
                        tel = [tel stringByReplacingOccurrencesOfString:@" " withString:@""];
                        [phoneNum addObject:tel];
                        break;
                    }
                }
                CFRelease(value);
            }
            CFRelease(valuesRef);
        }
        if (abName) CFRelease(abName);
        if (abLastName) CFRelease(abLastName);
        if (abFullName) CFRelease(abFullName);
        if (phoneNum.count==1) {
            NSString * string = [phoneNum[0] substringToIndex:1];
            [dict setValue:phoneNum[0] forKey:@"phone"];
            if([phoneNum[0]length]==11&&[string isEqualToString:@"1"]){
                [peopleArr addObject:dict];
            }
        }else{
            for(NSString * tele in phoneNum){
                dicti=[NSMutableDictionary dictionary];
                [dicti setValue:nameString forKey:@"name"];
                [dicti setValue:tele forKey:@"phone"];
                NSString * string = [tele substringToIndex:1];
                NSLog(@"%@", [tele substringToIndex:1]);
                if(tele.length==11&&[string isEqualToString:@"1"]){
                    [peopleArr addObject:dicti];
                }
            }
        }
        
        
    }

    return peopleArr;
}

+ (void)directPhoneCallWithPhoneNum:(NSString *)phoneNum {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNum]]];
}

@end
