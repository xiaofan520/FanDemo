//
//  MainViewController.m
//  FanDemo
//
//  Created by fan on 2017/12/12.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import "MainViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createViewControllers];

}
- (void)createViewControllers{
    
    OneViewController *mapVC =[[OneViewController alloc]init];
    mapVC.title = @"one";
    mapVC.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    UINavigationController *mapNc = [[UINavigationController alloc] initWithRootViewController:mapVC];
//    mapNc.navigationBarHidden =YES;//首页隐藏导航
//    mapNc.tabBarItem.selectedImage = getImageName(@"首页-灰色");
//    mapNc.tabBarItem.image = getImageName(@"首页");
    
    TwoViewController *healthVC =[[TwoViewController alloc]init];
    //    healthVC.title = @"健康";
    healthVC.title = @"two";
    UINavigationController *healthNc = [[UINavigationController alloc] initWithRootViewController:healthVC];
//    healthNc.navigationBarHidden =YES;
//    healthNc.tabBarItem.selectedImage = getImageName(@"健康");
//    healthNc.tabBarItem.image = getImageName(@"健康-灰色");
    
    
   ThreeViewController* circleVC =[[ThreeViewController alloc]init];
    //    circleVC.title = @"圈子";
    circleVC.title = @"three";
    UINavigationController *circleNc = [[UINavigationController alloc] initWithRootViewController:circleVC];
//    circleNc.navigationBarHidden =YES;
//    circleNc.tabBarItem.selectedImage = getImageName(@"聊天");
//    circleNc.tabBarItem.image = getImageName(@"聊天-灰色");
    
    
    FourViewController *minVC = [[FourViewController alloc] init];
    //    minVC.title = @"我的";
    minVC.title = @"four";
    UINavigationController *minNc = [[UINavigationController alloc] initWithRootViewController:minVC];
//    minNc.navigationBarHidden =YES;
//    minNc.tabBarItem.selectedImage = getImageName(@"我");
//    minNc.tabBarItem.image = getImageName(@"我-灰色");
    //    [minNc.tabBarItem setBadgeValue:@"3333"];
    
    self.viewControllers =@[mapNc,healthNc,circleNc,minNc];
    self.selectedIndex = 0;
    
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    //    [self animationWithIndex:index];
    
}
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.1;
    pulse.repeatCount= 0.5;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.0];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
}

#pragma mark - public


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
