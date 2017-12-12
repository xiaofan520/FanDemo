//
//  MasonryViewController.m
//  FanDemo
//
//  Created by fan on 2017/12/12.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import "MasonryViewController.h"

@interface MasonryViewController ()
@property (nonatomic,strong)UITextField*textField ;
@property (nonatomic,strong)NSArray*array;
@property (nonatomic,strong)NSArray*listText;
@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self mask1];
    //    [self mask2];
    //    [self mask3];
    //    [self mask4];
    
    //    [self mask5];
    //    [self mask6];
}
- (void)mask6{
    
    UIView* bgView       = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.top.mas_equalTo(@100);
        make.height.mas_equalTo(@100);
    }];
    
    _listText = @[@"北京",@"地大吴波啊",@"你大爷",@"我们的爱哎哎11111111111111111"];
    UIView *lastSpaceView = nil;
    for(int i = 0 ; i < _listText.count;  i ++)
    {
        UILabel* label = [UILabel new];
        label.text     = _listText[i];
        label.backgroundColor = [UIColor orangeColor];
        [bgView addSubview:label];
        
        UIView* lineView         = [UIView new];
        lineView.backgroundColor = [UIColor redColor];
        [bgView addSubview:lineView];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            if (lastSpaceView)
            {
                NSLog(@"存在 lastView");
                make.left.equalTo(lastSpaceView.mas_right).mas_offset(@20);
            }else
            {
                NSLog(@"不存在存在 lastView");
                make.left.equalTo(bgView.mas_left);
            }
            make.height.equalTo(bgView);
        }];
        
        lastSpaceView = label;
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(0);
            make.width.mas_equalTo(1);
            make.left.mas_equalTo(label.mas_right).mas_offset(@10);
        }];
    }
}

- (void)mask5{
    UIButton *bt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *bt3 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    bt1.backgroundColor = [UIColor orangeColor];
    bt2.backgroundColor = [UIColor orangeColor];
    bt3.backgroundColor = [UIColor orangeColor];
    
    [bt1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [bt2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [bt3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [bt1 setTitle:@"111" forState:UIControlStateNormal];
    [bt2 setTitle:@"222" forState:UIControlStateNormal];
    [bt3 setTitle:@"333" forState:UIControlStateNormal];
    [self.view addSubview:bt1];
    [self.view addSubview:bt2];
    [self.view addSubview:bt3];
    
    
    
    _array = @[bt1,bt2,bt3];
    /**
     *  多个控件固定间隔的等间隔排列，变化的是控件的长度或者宽度值
     *
     *  @param axisType        轴线方向
     *  @param fixedSpacing    间隔大小
     *  @param leadSpacing     头部间隔
     *  @param tailSpacing     尾部间隔
     */
    //    [_array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:10 tailSpacing:10];
    //    [_array mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.mas_equalTo(10);
    //        make.width.mas_equalTo(50);
    //    }];
    
    /**
     *  多个固定大小的控件的等间隔排列,变化的是间隔的空隙
     *
     *  @param axisType        轴线方向
     *  @param fixedItemLength 每个控件的固定长度或者宽度值
     *  @param leadSpacing     头部间隔
     *  @param tailSpacing     尾部间隔
     */
    [_array mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:60 leadSpacing:10 tailSpacing:10];
    [_array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(30);
        make.centerX.equalTo(self.view);
    }];
    
}

- (void)mask1{
    UILabel*lb = [[UILabel alloc] initWithFrame:CGRectZero];
    lb.backgroundColor = [UIColor redColor];
    lb.numberOfLines =0;
    lb.text = @"wwkeopkpfidojfidjfidjfdwwkeopkpfidojfidjfidjfdwwkeopkpfidojfidjfidjfdwwkeopkpfidojfidjfidjfdwwkeopkpfidojfidjfidjfd";
    [self.view addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
    UILabel*lb1 = [[UILabel alloc] initWithFrame:CGRectZero];
    lb1.backgroundColor = [UIColor redColor];
    lb1.numberOfLines =0;
    lb1.text = @"fidjfidjfdwwk我是的念佛ID房地of第of的";
    [self.view addSubview:lb1];
    
    [lb1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(lb.mas_left).offset(0);
        make.top.equalTo(lb.mas_bottom).offset(10);
        make.width.mas_equalTo(40);
        
    }];
    
}

- (void)mask2{
    
    //
    UIView* blackView       = [UIView new];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加约束大小
        make.size.mas_equalTo(CGSizeMake(100, 100));
        //在 左,上 添加约束 (左、上约束都是20）
        make.left.and.top.mas_equalTo(20);
    }];
    
    UIView* grayView         = [UIView new];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayView];
    
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 大小、上边距约束与黑色view相同
        make.size.and.top.equalTo(blackView);
        // 添加右边距约束（这里的间距是有方向性的，左、上边距约束为正数，右、下边距约束为负数）
        make.right.mas_equalTo(-20);
    }];
}

- (void)mask3{
    // 防止block中的循环引用
    __weak typeof(self) weakSelf = self;
    UIView* view         = [UIView new];
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];
    //使用mas_makeConstraints添加约束
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 添加大小约束（make就是要添加约束的控件view）
        make.size.mas_equalTo(CGSizeMake(200, 200));
        
        // 添加居中约束（居中方式与self相同）
        make.center.equalTo(weakSelf.view);
    }];
    
    
}
- (void)mask4{
    _textField                 = [UITextField new];
    _textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:_textField];
    __weak typeof(self) weakSelf = self;
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        //left,right,centerx,y  不能共存只能有其二
        make.left.mas_equalTo(20);
        //        make.right.mas_equalTo(-60);
        make.centerX.equalTo(weakSelf.view);
        
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(0);
    }];
    
    // 注册键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification {
    
    // 获取键盘基本信息（动画时长与键盘高度）
    NSDictionary *userInfo = [notification userInfo];
    CGRect rect = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight   = CGRectGetHeight(rect);
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 修改下边距约束
    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(-keyboardHeight);
    }];
    
    // 更新约束
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHideNotification:(NSNotification *)notification {
    
    // 获得键盘动画时长
    NSDictionary *userInfo   = [notification userInfo];
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 修改为以前的约束（距下边距0）
    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
    }];
    
    // 更新约束
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
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
