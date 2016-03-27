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
#import "ImageRollScrollView.h"

@interface HomeSubViewController ()
@end

@implementation HomeSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutForView];
}

- (void)layoutForView {
    UIImage *image1 = [UIImage imageNamed:@"01.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"02.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"03.jpg"];
    NSArray *imageArray = [[NSArray alloc]initWithObjects:image1,image2,image3,nil];
    NSArray *textArray = @[@"我美吗",@"吻我",@"别说话"];
    ImageRollScrollView *imageScrollView = [[ImageRollScrollView alloc]initWithFrame:CGRectMake(0, 0, 375, 465)];
    [self.view addSubview:imageScrollView];
    [imageScrollView loadImages:imageArray withRollTime:2.0f optionalText:textArray];
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
