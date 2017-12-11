//
//  UIViewController+CHAlert.h
//  GuanHuTongV2
//
//  Created by fan on 17/3/31.
//  Copyright © 2017年 changhongit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CHAlert)


/**
 系统AleartActionSheet提示框

 @param titleArray      弹出内容
 @param sureButtonBlock 点击哪一个
 */
- (void)showAlartSheetTitleArray:(NSArray *)titleArray didSelectIndexBlock:(void(^)(NSInteger index))IndexChoose;


/**
 系统UIAlertViewVC 弹出框提示

 @param title            title
 @param contentMessage   内容
 @param chooseTitleArray 操作按钮Array
 @param IndexChoose      选择
 */
-(void)showAlertTitle:(NSString *)title contentMessage:(NSString *)contentMessage choosetitleArray:(NSArray*)chooseTitleArray  didSelectIndexBlock:(void(^)(NSInteger index))IndexChoose;


/**
 系统UIAlertViewVC 带输入框的弹出框

 @param title            title
 @param contentMessage   内容
 @param textPlaceHolder  textField 的palceholder
 @param chooseTitleArray 操作按钮array
 @param textAlert        选择和输入框内容
 */
-(void)showTextAlertViewWithTitle:(NSString *)title contentMessage:(NSString *)contentMessage textPlaceholder:(NSString *)textPlaceHolder choosetitleArray:(NSArray*)chooseTitleArray  didSelectIndexBlock:(void(^)(NSInteger index,NSString *newText))textAlert;



@end
