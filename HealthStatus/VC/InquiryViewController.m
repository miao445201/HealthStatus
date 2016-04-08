//
//  InquiryViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/23.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "InquiryViewController.h"
#import "InquiryTableViewCell.h"
#import "InquiryDetailViewController.h"
#import "MJRefresh.h"

@interface InquiryViewController ()
@property (weak, nonatomic) IBOutlet UITableView *inquiryTableView;

@end

@implementation InquiryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"健康资讯";
    [self loadSubViews];
    
}

- (void)loadSubViews {
    self.inquiryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    }];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.inquiryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.inquiryTableView.mj_header beginRefreshing];
}

- (void)loadNewData{
    sleep(2.);
    [self.inquiryTableView.mj_header endRefreshing];
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
    static NSString *secondId = @"InquiryTableViewCell";
    //初始化cell并指定其类型，也可自定义cell
    InquiryTableViewCell *cell = (InquiryTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:secondId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InquiryTableViewCell" owner:self options:nil] lastObject];
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
    InquiryDetailViewController *inquiryDetail = [[InquiryDetailViewController alloc]init];
    [self.navigationController pushViewController:inquiryDetail animated:YES];
}

@end
