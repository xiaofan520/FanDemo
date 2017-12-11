//
//  UIViewController+CHAlert.m
//  GuanHuTongV2
//
//  Created by fan on 17/3/31.
//  Copyright © 2017年 changhongit. All rights reserved.
//

#import "UIViewController+CHAlert.h"

@implementation UIViewController (CHAlert)

- (void)showAlartSheetTitleArray:(NSArray *)titleArray didSelectIndexBlock:(void(^)(NSInteger index))IndexChoose{
    
    UIAlertController * alertControl =[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSInteger i= 0; i < titleArray.count; i++) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:titleArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (IndexChoose) {
                IndexChoose(i);
            }
        }];
        [alertControl addAction:action];
        
    }
    UIAlertAction * cancleAction   =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    [cancleAction setValue:[UIColor redColor] forKey:@"_titleTextColor"];
    [alertControl addAction:cancleAction];
     [self presentViewController:alertControl animated:YES completion:nil];
    
}



-(void)showAlertTitle:(NSString *)title contentMessage:(NSString *)contentMessage choosetitleArray:(NSArray*)chooseTitleArray  didSelectIndexBlock:(void(^)(NSInteger index))IndexChoose{

    UIAlertController * alertControl =[UIAlertController alertControllerWithTitle:title message:contentMessage preferredStyle:UIAlertControllerStyleAlert];
    for (NSInteger i= 0; i < chooseTitleArray.count; i++) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:chooseTitleArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (IndexChoose) {
                IndexChoose(i);
            }
        }];
        [alertControl addAction:action];
    }
    [self presentViewController:alertControl animated:YES completion:nil];


    
}
-(void)showTextAlertViewWithTitle:(NSString *)title contentMessage:(NSString *)contentMessage textPlaceholder:(NSString *)textPlaceHolder choosetitleArray:(NSArray *)chooseTitleArray didSelectIndexBlock:(void (^)(NSInteger, NSString *))textAlert {
    __block UITextField *textfield = nil;
    UIAlertController * alertControl =[UIAlertController alertControllerWithTitle:title message:contentMessage preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = textPlaceHolder;
        
        textfield = textField;
    }];
    for (NSInteger i= 0; i < chooseTitleArray.count; i++) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:chooseTitleArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (textAlert) {
                textAlert(i,textfield.text);
            }
        }];
        [alertControl addAction:action];
    }
    [self presentViewController:alertControl animated:YES completion:nil];
    
    

}



@end
