//
//  UILabel+ext.h
//  Hodor
//
//  Created by JeremyLyu_PinGuo on 15-1-5.
//  Copyright (c) 2015年 zhangchutian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ext)

- (void)hSetColor:(UIColor *)color font:(UIFont *)font text:(NSString *)title;

/**
 设置lable的内容以及内容之间的间距

 @param text 内容
 @param lineSpace 第二行距离第一行底部的距离
 */
- (void)hSetText:(NSString *)text lineSpace:(CGFloat)lineSpace;

/**
 *  compute height of a text with line height
 *
 *  @param text
 *  @param font
 *  @param lineSpace
 *  @param width
 *
 *  @return
 */
+ (CGFloat)hGetTextHeightWith:(NSString *)text font:(UIFont *)font lineSpace:(CGFloat)lineSpace width:(CGFloat)width;
@end
