//
//  myLjjTools.h
//  myBase
//
//  Created by shuoyeah on 16/5/25.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 颜色相关
 */
#define rgb(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
/**
 屏幕尺寸相关
 */
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define WHSCALE_WIDTH            [UIScreen mainScreen].bounds.size.width/375.f
#define WHSCALE_HEIGHT           [UIScreen mainScreen].bounds.size.height/667.f
typedef void(^trueBack)(NSString * ss);

@interface myLjjTools : NSObject<UIAlertViewDelegate>{


}
@property (nonatomic , copy) trueBack  trueBack;
/*
 ==================================
 按钮
 ==================================
 */
/**基本按钮*/
+ (UIButton *)createButtonWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andBgColor:(UIColor *)bgColor andImage:(UIImage *)image andBgImage:(UIImage *)bgImage andSelecter:(SEL)sel andTarget:(id)target;
/**切圆角按钮*/
+ (UIButton *)createButtonWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andBgColor:(UIColor *)bgColor andImage:(UIImage *)image andBgImage:(UIImage *)bgImage andSelecter:(SEL)sel andTarget:(id)target andCornerRadius:(CGFloat)corner;
/**选择按钮*/
+ (UIButton *)createButtonWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andBgColor:(UIColor *)bgColor andImage:(UIImage *)image andBgImage:(UIImage *)bgImage andSelecter:(SEL)sel andTarget:(id)target andforState:(UIControlState)state andStateTitle:(NSString *)stateTitle andStateTitleColor:(UIColor *)stateTitleColor andStateImage:(UIImage *)stateImage andStateBgImage:(UIImage *)stateBgImage andCornerRadius:(CGFloat)corner;
/***简化按钮*/
+ (UIButton *)createButtonWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andBgColor:(UIColor *)bgColor  andSelecter:(SEL)sel andTarget:(id)target andCornerRadius:(CGFloat)corner;
/*
 ================================================
 label
 ================================================
 */
/**基本label*/
+(UILabel *)createLabelWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andTextAlignment:(NSTextAlignment)alignment  andBgColor:(UIColor *)bgColor;
/**行数 文字大小 自适应label高度*/
+(UILabel *)createLabelWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andTextAlignment:(NSTextAlignment)alignment  andBgColor:(UIColor *)bgColor andLines:(NSInteger)numberOfLines andAdjustsFontSizeToFiWidth:(BOOL)sizeBool;
/** 自适应文字高度*/
+(UILabel *)createLabelWithFrame:(CGRect)rect andTitle:(NSString *)title andTitleFont:(UIFont *)titleFont andTitleColor:(UIColor *)titleColor andTextAlignment:(NSTextAlignment)alignment  andBgColor:(UIColor *)bgColor andCGSizeWIDTH:(CGFloat )width;
/** label内容颜色不一样*/

+(UILabel *)createLabelTextWithView:(UILabel *)label andwithChangeColorTxt:(NSString *)string withColor:(UIColor *)color;
/** 计算文本内容高度*/

+(CGSize)countTxtWith:(NSString *)text andWithFont:(UIFont *)font with:(CGFloat)width;

/*
 ================================================
 导航栏按钮
 ================================================
 */
/**导航栏按钮*/

+(UIBarButtonItem *)createButtonItemWith:(UIView *)customView;

/*
 ================================================
 view
 ================================================
 */
/**基本view*/
+(UIView *)createViewWithFrame:(CGRect)rect andBgColor:(UIColor *)bgColor;
/**特殊View*/
+(UIView *)createViewWithFrame:(CGRect)rect andBgColor:(UIColor *)bgColor andCornerRaduis:(CGFloat)corner andBorderWidth:(CGFloat)border andBorderColor:(UIColor *)bdColor shadowColor:(UIColor *)shadowColor andShadowOffset:(CGSize)offset andShadowOpacity:(float)opacity andShadowRadius:(CGFloat)radius;
/*
 ================================================
 Image
 ================================================
 */
/**image*/
+(UIImageView *)createImageViewWithFrame:(CGRect)rect andImage:(UIImage *)image andBgColor:(UIColor *)bgColor;
/**imageName*/
+(UIImageView *)createImageViewWithFrame:(CGRect)rect andImageName:(NSString *)imageName andBgColor:(UIColor *)bgColor;
/**image路径*/
+(UIImageView *)createImageViewWithFrame:(CGRect)rect andImageResource:(NSString *)imageResource andImageType:(NSString *)typpe andBgColor:(UIColor *)bgColor;

/*
 ================================================
 UITextField
 ================================================
 */
/**
 textField
 */
+(UITextField *)createTextFieldFrame:(CGRect)rect andBgColor:(UIColor *)bgColor andPlaceholder:(NSString *)placeholder andTextColor:(UIColor *)textColor andTextFont:(UIFont * )font andTextAlignment:(NSTextAlignment)alignment andSecureText:(BOOL)secure andBorderStyle:(UITextBorderStyle)borderStyle andReturnType:(UIReturnKeyType)returnType andClearButtonMode:(UITextFieldViewMode)buttonMode;

/**
 简化输入框
 */
+(UITextField *)createTextFieldFrame:(CGRect)rect andBgColor:(UIColor *)bgColor andPlaceholder:(NSString *)placeholder andTextColor:(UIColor *)textColor andTextFont:(UIFont * )font andReturnType:(UIReturnKeyType)returnType;
/**
 *  消息提醒
 *
 *  @param Title   标题
 *  @param message 信息
 *  @param trTitle 按钮名字
 *  @param cancle  按钮名字
 *  @param ss      weizhi
 */
+(UIAlertView *)alertControllerWithTitle:(NSString *)Title  message:(NSString *)message trueTitle:(NSString *)trTitle  cancelTitle:(NSString *)cancle delac:(id)ss;
//RGB颜色转换
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

//压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
//-------------------------------------------------获取通讯录-----------------------

+(NSMutableArray *)getMyPhoneBook;
@end
