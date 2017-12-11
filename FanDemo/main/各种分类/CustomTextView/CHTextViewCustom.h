//
//  CHTextViewCustom.h
//  GuanHuTongV2
//
//  Created by fan on 17/6/19.
//  Copyright © 2017年 changhongit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHTextViewCustom : UITextView
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
@end
