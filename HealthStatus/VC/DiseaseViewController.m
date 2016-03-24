//
//  DiseaseViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/19.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "DiseaseViewController.h"

@interface DiseaseViewController ()

@end

@implementation DiseaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"冠心病";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)homeBackButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:kReturnToHomeNotification object:nil];
}

@end
