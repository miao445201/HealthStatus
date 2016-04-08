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
#import "InquiryViewController.h"
#import "ImageRollScrollView.h"
#import "ActivityDetailViewController.h"

@interface HomeSubViewController ()
@property (weak, nonatomic) IBOutlet UITableView *activityTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet ImageRollScrollView *imageScrollView;
@end

@implementation HomeSubViewController
@synthesize imageScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self layoutForView];
    self.activityTableView.delegate = self;
    self.activityTableView.dataSource = self;
}

//- (void)viewWillAppear:(BOOL)animated {
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
//    self.navigationController.navigationBar.shadowImage = nil;
//}
//- (void)viewDidAppear:(BOOL)animated {
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
//    self.navigationController.navigationBar.shadowImage = nil;
//}

- (void)layoutForView {
    UIImage *image1 = [UIImage imageNamed:@"01.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"02.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"03.jpg"];
    NSArray *imageArray = [[NSArray alloc]initWithObjects:image1,image2,image3,nil];
    NSArray *textArray = @[@"我美吗",@"吻我",@"别说话"];
    [imageScrollView loadImages:imageArray withRollTime:2.0f optionalText:textArray];
}
- (IBAction)diseaseButtonClicked:(id)sender {
    RootViewController *rootVC = [[RootViewController alloc]init];
    [self.navigationController pushViewController:rootVC animated:YES];
    
}
- (IBAction)fitnessButtonClidked:(id)sender {
    ActivityViewController *activityVC = [[ActivityViewController alloc]init];
    [self.navigationController pushViewController:activityVC animated:YES];
}
- (IBAction)checkButtonClicked:(id)sender {
    InquiryViewController *inquiryVC = [[InquiryViewController alloc]init];
    [self.navigationController pushViewController:inquiryVC animated:YES];
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    static NSString *secondId = @"ActivityTableViewCell";
    //初始化cell并指定其类型，也可自定义cell
    ActivityTableViewCell *cell = (ActivityTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:secondId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ActivityTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    ActivityDetailViewController *activityDetail = [[ActivityDetailViewController alloc]init];
//    [self.navigationController pushViewController:activityDetail animated:YES];

}

@end
