//
//  ThreeViewController.m
//  FanDemo
//
//  Created by fan on 2017/12/12.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import "ThreeViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>
@interface ThreeViewController ()

@end

@implementation ThreeViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    //runloop监听事件
  NSTimer *timer =   [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(go) userInfo:nil repeats:YES];
// runloop 监听timer runloop 只能获取不能创建  同时添加到默认模式和ui模式下才能在滚动和停止的时候会打印
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes]; // 相当于上面两句
    

    
    
    
    // runtime 平时工作中的案例  需求，改变一个老项目的某个系统方法，可以有用runtime 的改变系统方法
    //oc的方法由两个东西构成：SEl 方法编号  IMP
    
    // 发送消息 需要在setting设置 msg 检查为NO
    objc_msgSend(self, @selector(go));
    typedef struct objc_method *Method; //成员方法
    
    /// An opaque type that represents an instance variable.
    typedef struct objc_ivar *Ivar;// 成员变量
    
    
    
    
}


// 栈 ：由系统分配的（所有的局部变量）
// 堆：程序猿开辟的
//内存释放：当内存释放后这块区域还有数据吗？ --- 有！！

- (void)go{
    
    NSLog(@"lail");
    static int a= 0 ;
    a++;
    NSLog(@"%d--%@",a,[NSThread currentThread]);
    
    // 如果界面有可以滚动的控件 在滚动的时候是不会打印的，因为NSDefaultRunLoopMode下 runloop只会处理触摸事件
    //runloop 会处理三种事件  Source Observe Timer
    //每个一秒 默认模式下就会触发Timer事件 执行完runloop就会休眠
    
    // 为什么默认模式下拖拽不打印呢？
    //runloop UI模式下的特点  1 ui模式会优先执行 2 runloop只能被触摸事件所唤醒 不能被timer 和网络事件唤醒
    
    
    
    //UITrackingRunLoopMode 这个就是用来处理ui的 会打印
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
