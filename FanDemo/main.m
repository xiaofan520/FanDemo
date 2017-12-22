//
//  main.m
//  FanDemo
//
//  Created by fan on 2017/12/7.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
    
   
    @autoreleasepool {
        
        //  UIApplicationMain开启了一个死循环（runloop）
        // 目的 1 保证程序不会退出（当前线程不会退出）
        //     2 用来监听事件 （触摸事件、timer事件、网络事件）
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
