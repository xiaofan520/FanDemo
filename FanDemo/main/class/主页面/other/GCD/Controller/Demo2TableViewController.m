//
//  Demo2TableViewController.m
//  GCD
//
//  Created by Charles on 17/1/9.
//  Copyright © 2017年 Charles. All rights reserved.
//

#import "Demo2TableViewController.h"
#import "CYGCDImageModel.h"

@interface Demo2TableViewController ()

@end

@implementation Demo2TableViewController{
    dispatch_group_t _group;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Download four pictures sequentially, then notify the group;
    
    // (1->2->3->4)orderly ->notify
    
    self.navigationItem.title = @"Demo2(有序)";
    
    _group = dispatch_group_create();
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loadData];
    });
}

- (void)loadData {
    
    //停车场剩余4个车位，那么即使同时来了四辆车也能停的下。如果此时来了五辆车，那么就有一辆需要等待。信号量的值就相当于剩余车位的数目，dispatch_semaphore_wait函数就相当于来了一辆车，dispatch_semaphore_signal。就相当于走了一辆车。停车位的剩余数目在初始化的时候就已经指明了（dispatch_semaphore_create(value:Int)）），调用一次dispatch_semaphore_signal，剩余的车位就增加一个；调用一次dispatch_semaphore_wait剩余车位就减少一个；当剩余车位为0时，再来车（即调用dispatch_semaphore_wait）就只能等待。有可能同时有几辆车等待一个停车位。有些车主。没有耐心，给自己设定了一段等待时间，这段时间内等不到停车位就走了，如果等到了就开进去停车。而有些车主就像把车停在这，所以就一直等下去。
    
    //　在GCD中有三个函数是semaphore的操作，分别是：
//    　　dispatch_semaphore_create　　　创建一个semaphore
//    　　dispatch_semaphore_signal　　　发送一个信号
//    　　dispatch_semaphore_wait　　　　等待信号
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    // 1.
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER); // -1
    dispatch_group_enter(_group);
    dispatch_group_async(_group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlStrs[0]]];
        CYGCDImageModel *model = [CYGCDImageModel new];
        model.imageData = data;
        [self.dataArray addObject:model];
        dispatch_group_leave(_group);
        dispatch_semaphore_signal(semaphore); // + 1
    });
    
    // 2.
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dispatch_group_enter(_group);
    dispatch_group_async(_group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlStrs[1]]];
        CYGCDImageModel *model = [CYGCDImageModel new];
        model.imageData = data;
        [self.dataArray addObject:model];
        dispatch_group_leave(_group);
        dispatch_semaphore_signal(semaphore);
    });
    
    // 3.
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dispatch_group_enter(_group);
    dispatch_group_async(_group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlStrs[2]]];
        CYGCDImageModel *model = [CYGCDImageModel new];
        model.imageData = data;
        [self.dataArray addObject:model];
        dispatch_group_leave(_group);
        dispatch_semaphore_signal(semaphore);
    });
    
    // 4.
   dispatch_time_t  t = dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dispatch_group_enter(_group);
    dispatch_group_async(_group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlStrs[3]]];
        CYGCDImageModel *model = [CYGCDImageModel new];
        model.imageData = data;
        [self.dataArray addObject:model];
        dispatch_group_leave(_group);
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_group_notify(_group, dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

@end
