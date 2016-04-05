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

@interface InquiryViewController ()
@property (weak, nonatomic) IBOutlet UITableView *inquiryTableView;

@end

@implementation InquiryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"健康资讯";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
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
