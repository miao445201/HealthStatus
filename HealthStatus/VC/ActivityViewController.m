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
    static NSString *secondId = @"ActivityTableViewCell";
    //初始化cell并指定其类型，也可自定义cell
    ActivityTableViewCell *cell = (ActivityTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:secondId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ActivityTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ActivityDetailViewController *activityDetail = [[ActivityDetailViewController alloc]init];
    [self.navigationController pushViewController:activityDetail animated:YES];
}

@end
