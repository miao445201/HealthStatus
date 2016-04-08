//
//  ActivityViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/22.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityDetailViewController.h"
#import "MJRefresh.h"

@interface ActivityViewController ()
@property (weak, nonatomic) IBOutlet UITableView *activityTableView;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"健康运动";
    // Do any additional setup after loading the view from its nib.
    self.activityTableView.delegate = self;
    self.activityTableView.dataSource = self;
    [self loadSubViews];
}

- (void)loadSubViews {
    self.activityTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    }];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.activityTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.activityTableView.mj_header beginRefreshing];
}

- (void)loadNewData{
    sleep(2.);
    [self.activityTableView.mj_header endRefreshing];
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
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
    ActivityDetailViewController *activityDetail = [[ActivityDetailViewController alloc]init];
    [self.navigationController pushViewController:activityDetail animated:YES];
}


@end
