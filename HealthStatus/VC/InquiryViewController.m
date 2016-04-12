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
#import "InquiryModel.h"

@interface InquiryViewController ()
@property (weak, nonatomic) IBOutlet UITableView *inquiryTableView;
@property (strong,nonatomic) NSMutableArray *dataArray;
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
    sleep(1.);
    
    InquiryModel *model1 = [[InquiryModel alloc]init];
    model1.inquiryImage = [UIImage imageNamed:@"04.jpg"];
    model1.inquiryTitle = @"20种咖啡渣妙用，从做菜到吸甲醛";
    model1.corePrompt = @"超过一半的美国人每天喝咖啡超过18杯。";
    model1.releaseTime = @"3月13日 周三 18:00";
    model1.enjoyNumber = @"3754人喜欢";
    
    InquiryModel *model2 = [[InquiryModel alloc]init];
    model2.inquiryImage = [UIImage imageNamed:@"02.jpg"];
    model2.inquiryTitle = @"一个简单测试 预知心血管疾病风险";
    model2.corePrompt = @"每年有超过1700万人死于心血管疾病。";
    model2.releaseTime = @"7月13日 周五 09:16";
    model2.enjoyNumber = @"307个人喜欢";
    
    InquiryModel *model3 = [[InquiryModel alloc]init];
    model3.inquiryImage = [UIImage imageNamed:@"03.jpg"];
    model3.inquiryTitle = @"做不同的运动实际能消耗多少热量？";
    model3.corePrompt = @"你自我感觉很好，这才是最重要的。";
    model3.releaseTime = @"7月23日 周二 20:52";
    model3.enjoyNumber = @"5467个人喜欢";

    self.dataArray = [[NSMutableArray alloc]initWithObjects:model1,model2,model3, nil];
    [self.inquiryTableView reloadData];
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
    InquiryModel *selectModel = self.dataArray[indexPath.section];
    cell.inquiryTitleLabel.text = selectModel.inquiryTitle;
    cell.inquiryCorePromptLabel.text = selectModel.corePrompt;
    cell.enjoyNumberLabel.text = selectModel.enjoyNumber;
    cell.releaseTimeLabel.text = selectModel.releaseTime;
    cell.inquiryImageView.image = selectModel.inquiryImage;
    
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
