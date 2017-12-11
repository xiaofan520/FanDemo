//
//  UIButton+ext.h
//  Hodor
//
//  Created by zhangchutian on 15/6/29.
//  Copyright (c) 2015年 zhangchutian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ext)
- (void)hSetTitle:(NSString *)title;
- (void)hSetTitleColor:(UIColor *)color;
- (void)hSetFont:(UIFont *)font;
- (void)hSetColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title;
- (void)hSetImage:(UIImage *)image;
- (void)hAddTarget:(id)target action:(SEL)action;


/**
 防止重复点击 设置间隔时间
 */
@property (nonatomic, assign) NSTimeInterval custom_acceptEventInterval;// 可以用这个给重复点击加间隔

@end
