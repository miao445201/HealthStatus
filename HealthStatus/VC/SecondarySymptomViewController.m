//
//  SecondarySymptomViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/16.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "SecondarySymptomViewController.h"
#import "SecondarySymptomTableViewCell.h"
#import "InspectionResultViewController.h"

@interface SecondarySymptomViewController ()
@property (weak, nonatomic) IBOutlet UITableView *SecondSymTableView;

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

- (void)rightItemTapped {
    InspectionResultViewController *insResultVC = [[InspectionResultViewController alloc]init];
    [self.navigationController pushViewController:insResultVC animated:YES];
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        static NSString *secondId = @"SecondarySymptomTableViewCell";
        //初始化cell并指定其类型，也可自定义cell
        SecondarySymptomTableViewCell *cell = (SecondarySymptomTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:secondId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SecondarySymptomTableViewCell" owner:self options:nil] lastObject];
        }
        cell.SecondSymLabel.text = @"嗅觉丧失";
        
        return cell;
        
    }


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondarySymptomTableViewCell *cell = (SecondarySymptomTableViewCell *)[self.SecondSymTableView cellForRowAtIndexPath:indexPath];
}

@end
