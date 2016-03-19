//
//  InspectionResultViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/19.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "InspectionResultViewController.h"
#import "InspectionTableViewCell.h"
#import "DiseaseViewController.h"

@interface InspectionResultViewController ()

@end

@implementation InspectionResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自查结果";
    [self setRightNaviItemWithTitle:@"重查" imageName:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(returnToHome) name:kReturnToHomeNotification object:nil];
}

- (void)rightItemTapped {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)returnToHome {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    static NSString *secondId = @"InspectionTableViewCell";
    //初始化cell并指定其类型，也可自定义cell
    InspectionTableViewCell *cell = (InspectionTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:secondId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InspectionTableViewCell" owner:self options:nil] lastObject];
    }
    //cell.SecondSymLabel.text = @"嗅觉丧失";
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    InspectionTableViewCell *cell = (InspectionTableViewCell *)[self.diseaseTableView cellForRowAtIndexPath:indexPath];
    DiseaseViewController *diseaseVC = [[DiseaseViewController alloc]init];
    [self.navigationController presentViewController:diseaseVC animated:YES completion:nil];
}

@end
