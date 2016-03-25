//
//  MyHealthViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/22.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "MyHealthViewController.h"
@interface MyHealthViewController ()

@end

@implementation MyHealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的健康";
    [self getAuthorzation];
    // Do any additional setup after loading the view from its nib.
}

- (void)getAuthorzation {
    NSString *healthState = [HKHealthStore isHealthDataAvailable]?@"健康可用":@"健康不可用";
    NSLog(@"%@",healthState);
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
