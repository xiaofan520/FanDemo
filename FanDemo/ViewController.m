//
//  ViewController.m
//  FanDemo
//
//  Created by fan on 2017/12/7.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+ext.h"
#import "UIView+ext.h"
#import "NSDate+QKZCategory.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testLable];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
-(void)testLable{
    
    NSDate *date = [NSDate dateNow];
    
    NSLog(@"%@",[NSDate dateNow]);
    NSLog(@"%@",[NSDate dateTomorrow]);
    NSLog(@"%@",[NSDate dateYesterday]);
    NSLog(@"%@",[NSDate dateWithDaysFromNow:2]);
    NSLog(@"%@",[NSDate dateWithDaysBeforeNow:1]);
    NSLog(@"%@",[NSDate dateWithHoursFromNow:1]);
    NSLog(@"%@",[NSDate dateWithHoursBeforeNow:1]);
    NSLog(@"%@",[NSDate dateWithMinutesFromNow:5]);
    NSLog(@"%@",[NSDate dateWithMinutesBeforeNow:10]);
//    NSLog(@"%@",[NSDate dateYesterday]);

    
//    + (NSDate *) dateNow;
//    + (NSDate *) dateTomorrow;
//    + (NSDate *) dateYesterday;
//    + (NSDate *) dateWithDaysFromNow: (NSInteger) days;
//    + (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;
//    + (NSDate *) dateWithHoursFromNow: (NSInteger) dHours;
//    + (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours;
//    + (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes;
//    + (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes;
//
    
}


@end
