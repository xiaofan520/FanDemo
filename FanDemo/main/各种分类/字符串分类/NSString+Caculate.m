//
//  NSString+Caculate.m
//  GuanHuTongV2
//
//  Created by fan on 17/3/16.
//  Copyright © 2017年 changhongit. All rights reserved.
//

#import "NSString+Caculate.h"

@implementation NSString (Caculate)

/** 返回自适应高度的文本 */

+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxWidth:(CGFloat)maxWidth

{
    
    NSDictionary *attributesDict = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    
    CGRect subviewRect = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDict context:nil];
    
    return subviewRect.size;
    
}



/** 返回自适应宽度的文本 */

+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxHeight:(CGFloat)maxHeight

{
    
    NSDictionary *attributesDict = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    
    CGSize maxSize = CGSizeMake(MAXFLOAT, maxHeight);
    
    CGRect subviewRect = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDict context:nil];
    
    return subviewRect.size;
    
}


- (NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString{
    
    NSRange startRange = [self rangeOfString:startString];
    NSRange endRange = [self rangeOfString:endString];
    NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
    return [self substringWithRange:range];
    
}

-(NSString *)subStringToEnd:(NSString *)startString {
    NSRange startRange = [self rangeOfString:startString];
    return [self substringFromIndex:startRange.location+startRange.length];
}
@end
