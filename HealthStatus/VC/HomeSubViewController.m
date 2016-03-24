//
//  HomeSubViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/22.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "HomeSubViewController.h"
#import "RootViewController.h"
#import "ActivityViewController.h"
#import "MyHealthViewController.h"
#import "InquiryViewController.h"

@interface HomeSubViewController ()
@end

@implementation HomeSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)layoutForView {
}
- (IBAction)diseaseButtonClicked:(id)sender {
    RootViewController *rootVC = [[RootViewController alloc]init];
    [self.navigationController pushViewController:rootVC animated:YES];
    
}
- (IBAction)fitnessButtonClidked:(id)sender {
    self.tabBarController.selectedIndex = 2;
}
- (IBAction)checkButtonClicked:(id)sender {
    self.tabBarController.selectedIndex = 1;
}


@end
