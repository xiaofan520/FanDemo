//
//  OneViewController.m
//  FanDemo
//
//  Created by fan on 2017/12/12.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import "OneViewController.h"
#import "MasonryViewController.h"
#import "CAGradientLayerViewController.h"
@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray*array;
@end

@implementation OneViewController
-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen width], [UIScreen height]) style:UITableViewStyleGrouped];
//        _tableView.backgroundColor = [UIColor redColor];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    
    return _tableView;
    
}

-(NSMutableArray *)array{
    
    if (!_array) {
        _array = [NSMutableArray arrayWithObjects:@"Masonry基础使用",@"CAGradientLayer实现渐变色", nil];
    }
    return _array;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=YES;

    [self.view addSubview:self.tableView];
    [self te];
}
// 冒泡升序
-(void)te{
    
    NSMutableArray *arr_M = [NSMutableArray arrayWithObjects:@1,@4,@2,@3,@5,nil];
    
    //遍历`数组的个数`次
    /*
     i = 0 的时候，j的相邻两个位置都要比较排一下位置：
     j = 0 的时候：arr_M = 41235
     j = 1 的时候：arr_M = 42135
     j = 2 的时候：arr_M = 42315
     j = 3 的时候：arr_M = 42351
     
     i = 1;
     ……  ……
     */
    for (int i = 0; i < arr_M.count; ++i) {
        
        //遍历数组的每一个`索引`（不包括最后一个,因为比较的是j+1）
        for (int j = 0; j < arr_M.count-1; ++j) {
            
            //根据索引的`相邻两位`进行`比较` 小于降序
            if (arr_M[j]> arr_M[j+1]) {
                
                [arr_M exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
            
        }
    }
    
    NSLog(@"最终结果：%@",arr_M);
    
  
    
   
    int a[]={1,2,3,4,6,9,22,33,11,3,6,4};
    
    int temp;
    for (int i = 0; i<9; i++) {
        for (int j= 0; j<9-i; j++) {
            if (a[j] >a[j+1]) {
                temp =a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
            }
        }
    }
    /*验证：输出排序结果*/
    for(int i=0;i<10;i++) {
        
        printf("%d-",a[i]);
    }//
    
    
}

-(void)t{
    
    NSMutableArray *ar = [NSMutableArray arrayWithObjects:@5,@6,@3,@9,@4, nil];
    for (int i = 0; i<ar.count; ++i) {

        for (int j =0 ; j < ar.count-1; ++j) {
            if (ar[j] > ar[j+1]) {
                [ar exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    
    
   int a[10]={1,4,8,5,2,9,43};

    
    int temp;
    
    for ( int i = 0; i<9; i++) {
        for (int j = 0; j<9-i; j++) {
            if (a[j]>a[j+1]) {
                temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
            }
        }
        
    }
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identfier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identfier"];
        cell.textLabel.text = self.array[indexPath.row];
        
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            
            MasonryViewController *vc = [[MasonryViewController alloc] init];
            vc.title = self.array[0];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            
            CAGradientLayerViewController *vc = [[CAGradientLayerViewController alloc] init];
            vc.title = self.array[1];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
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
