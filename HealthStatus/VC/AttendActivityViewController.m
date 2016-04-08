//
//  AttendActivityViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/4/8.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "AttendActivityViewController.h"

@interface AttendActivityViewController ()
@property (weak, nonatomic) IBOutlet UIButton *goAroundButton;

@end

@implementation AttendActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubViews];
}

- (void)loadSubViews {
    self.title = @"我参加的活动";
    [[self.goAroundButton layer] setCornerRadius:5];
    [[self.goAroundButton layer] setBorderWidth:0.5];
    [[self.goAroundButton layer] setBorderColor:[UIColor lightGrayColor].CGColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)applyButtonClicked:(id)sender {
    self.tabBarController.selectedIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
