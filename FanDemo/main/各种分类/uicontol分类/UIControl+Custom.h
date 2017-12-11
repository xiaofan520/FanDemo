//
//  UIControl+Custom.h
//  GuanHuTongV2
//
//  Created by fan on 17/8/1.
//  Copyright © 2017年 changhongit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Custom)
@property (nonatomic, assign) NSTimeInterval custom_acceptEventInterval;// 可以用这个给重复点击加间隔
@end
