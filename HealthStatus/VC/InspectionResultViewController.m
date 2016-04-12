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
#import "DiseaseModel.h"

@interface InspectionResultViewController ()
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation InspectionResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubViews];
}

- (void)loadSubViews {
    self.title = @"自查结果";
    [self setRightNaviItemWithTitle:@"重查" imageName:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(returnToHome) name:kReturnToHomeNotification object:nil];
    
    DiseaseModel *model1 = [[DiseaseModel alloc]init];
    model1.diseaseName = @"冠心病";
    model1.progress = 0.6;
    
    DiseaseModel *model2 = [[DiseaseModel alloc]init];
    model2.diseaseName = @"血影细胞性青光眼";
    model2.progress = 0.4;
    
    DiseaseModel *model3 = [[DiseaseModel alloc]init];
    model3.diseaseName = @"视网膜血管炎";
    model3.progress = 0.3;
    
    DiseaseModel *model4 = [[DiseaseModel alloc]init];
    model4.diseaseName = @"惠普尔病";
    model4.progress = 0.1;

    self.dataArray = [[NSMutableArray alloc]initWithObjects:model1,model2,model3,model4, nil];

}
- (void)rightItemTapped {
 [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}

-(void)returnToHome {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    static NSString *secondId = @"InspectionTableViewCell";
    //初始化cell并指定其类型，也可自定义cell
    InspectionTableViewCell *cell = (InspectionTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:secondId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InspectionTableViewCell" owner:self options:nil] lastObject];
    }
    
    DiseaseModel *selectModel = self.dataArray[indexPath.row];
    cell.diseaseNameLabel.text = selectModel.diseaseName;
    cell.diseaseProgressView.progress = selectModel.progress;
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    InspectionTableViewCell *cell = (InspectionTableViewCell *)[self.diseaseTableView cellForRowAtIndexPath:indexPath];
    DiseaseViewController *diseaseVC = [[DiseaseViewController alloc]init];
    [self.navigationController presentViewController:diseaseVC animated:YES completion:nil];
}

@end
