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
@property (strong,nonatomic) NSMutableArray *activityImageArray;
@property (strong,nonatomic) NSMutableArray *activityTextArray;
@property (strong,nonatomic) NSMutableArray *activityTimeArray;
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
    //初始化滚动图
    UIImage *image1 = [UIImage imageNamed:@"01.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"02.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"03.jpg"];
    NSArray *imageArray = [[NSArray alloc]initWithObjects:image1,image2,image3,nil];
    NSArray *textArray = @[@"世界公认的最佳吃法 全球各地健康饮食清单",@"一个简单测试 预知心血管疾病风险",@"做不同的运动实际能消耗多少热量？"];
    [imageScrollView loadImages:imageArray withRollTime:3.0f optionalText:textArray];
    
    //初始化推荐图
    self.activityImageArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"IMG_0651.jpg"],[UIImage imageNamed:@"IMG_0653.jpg"],[UIImage imageNamed:@"IMG_0652.jpg"], nil];
    self.activityTextArray = [[NSMutableArray alloc]initWithObjects:@"小岛探春之苏州夏令营",@"苏州阳澄湖半岛最盛大梨花节",@"春天有约，相聚同里", nil];
    self.activityTimeArray = [[NSMutableArray alloc] initWithObjects:@"剩余2天3小时",@"剩余7天16小时",@"剩余5天8小时", nil];
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
    cell.activityImageView.image = self.activityImageArray[indexPath.section];
    cell.activityTitle.text = self.activityTextArray[indexPath.section];
    cell.activityTime.text = self.activityTimeArray[indexPath.section];
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
    ActivityDetailViewController *activityDetail = [[ActivityDetailViewController alloc]init];
    activityDetail.selectImage = self.activityImageArray[indexPath.section];
    [self.navigationController pushViewController:activityDetail animated:YES];

}

@end
