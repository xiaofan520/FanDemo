//
//  NSString+Caculate.h
//  GuanHuTongV2
//
//  Created by fan on 17/3/16.
//  Copyright © 2017年 changhongit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Caculate)

/**
 高度自适应

 @param string   将计算的文本
 @param font     文本的字体
 @param maxWidth 最大宽度

 @return 文本的size
 */
+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxWidth:(CGFloat)maxWidth;




/**
 宽度自适应

 @param string    将计算的文本
 @param font      文本字体
 @param maxHeight 最大高度

 @return 文本size
 */
+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxHeight:(CGFloat)maxHeight;

/**
 截取字符串

 @param startString 开始字符
 @param endString 结束字符
 @return 新String
 */
- (NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString;

-(NSString *)subStringToEnd:(NSString *)startString;

@end
