//
//  SecondarySymptomViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/16.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "SecondarySymptomViewController.h"

@interface SecondarySymptomViewController ()

@end

@implementation SecondarySymptomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSomething];
}

- (void)initSomething {
    self.title = @"选择次要症状";
    [self setRightNaviItemWithTitle:@"提交" imageName:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
