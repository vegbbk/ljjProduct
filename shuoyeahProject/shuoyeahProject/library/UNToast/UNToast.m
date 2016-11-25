//
//  UNToast.m
//  UNToast
//
//  Created by zhangyilong on 15/9/16.
//  Copyright © 2015年 zhangyilong. All rights reserved.
//

#import "UNToast.h"

@implementation UNToast

@synthesize callBack;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor blackColor];
        self.layer.cornerRadius = 5;
        self.layer.shadowColor  = [[UIColor blackColor] CGColor];
        self.layer.shadowOpacity= 0.8;
        self.layer.shadowOffset = CGSizeMake(1, 2);
        
        title = [[UILabel alloc] initWithFrame:self.bounds];
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor whiteColor];
        title.font = [UIFont systemFontOfSize:14];
        title.textAlignment = NSTextAlignmentCenter;
        title.numberOfLines = 0;
        [self addSubview:title];
        
        self.callBack = nil;
        
        self.alpha = 0.0;
        
        return self;
    }
    
    return nil;
}

+ (UNToast*)createInView:(NSString*)title Seconds:(NSInteger)secondes
{
    UNToast* toast = [[UNToast alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    [toast setTitle:title Seconds:secondes];
    
    return toast;
}

- (void)setTitle:(NSString*)text Seconds:(NSInteger)seconds
{
    title.text = text;
    showSeconds = seconds;
}

- (void)updateTitle
{
    UIView* view = self.superview;
    
    NSDictionary *attribute = @{NSFontAttributeName: title.font};
    
    CGSize retSize = [title.text boundingRectWithSize:CGSizeMake(view.frame.size.width - 20, view.frame.size.height - 20)
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    self.frame = CGRectMake(0, 0, retSize.width + 10, retSize.height + 10);
    self.center = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2);
    
    title.frame = self.bounds;
    title.center= CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(shown)];
    [UIView setAnimationDuration:0.5];
    self.alpha = 1.0;
    [UIView commitAnimations];
}

- (void)shown
{
    [self performSelector:@selector(hidde) withObject:nil afterDelay:showSeconds];
}

- (void)hidde
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(hidden)];
    [UIView setAnimationDuration:0.5];
    self.alpha = 0.0;
    [UIView commitAnimations];
}

- (void)hidden
{
    if (callBack) callBack(self);
    
    [self removeFromSuperview];
}

- (void)showInView:(UIView*)view
{
    [view addSubview:self];
    
    [self updateTitle];
}

@end
