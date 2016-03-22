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
@property (weak, nonatomic) IBOutlet UILabel *mainSymptomLabel;
@property (nonatomic,strong)    NSMutableArray *selectSymArray;
@end

@implementation SecondarySymptomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSomething];
}

- (void)initSomething {
    self.title = @"选择次要症状";
    [self setRightNaviItemWithTitle:@"提交" imageName:nil];
    self.symptomArray = [[NSMutableArray alloc] initWithObjects:@"咽喉干燥及灼热感",@"发烧",@"咽痛",@"神经痛",@"淋巴结肿大",@"多尿",@"多饮",@"乏力",@"腹痛",@"胃肠道症状",@"昏睡",@"恶心",@"食欲减退",@"面痛",@"头晕",@"嗅觉丧失",@"呼吸困难",@"无力",@"食欲不振",@"头晕",@"囊肿",@"恶心与呕吐",@"肌痛",@"低热",@"流泪", nil];
    self.selectSymArray = [[NSMutableArray alloc]initWithCapacity:self.symptomArray.count];
    self.mainSymptomLabel.text = self.mainSymptom;
}

- (void)rightItemTapped {
    InspectionResultViewController *insResultVC = [[InspectionResultViewController alloc]init];
    [self.navigationController pushViewController:insResultVC animated:YES];
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return self.symptomArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        static NSString *cellId = @"SecondarySymptomTableViewCell";
        static NSString *selectCellId = @"SelectSecondarySymptomTableViewCell";
        NSString *resultCellId = [self stateForCellSelect:indexPath]?selectCellId:cellId;
    
        //初始化cell并指定其类型，也可自定义cell
        SecondarySymptomTableViewCell *cell = (SecondarySymptomTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:resultCellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SecondarySymptomTableViewCell" owner:self options:nil] lastObject];
        }
        cell.SecondSymLabel.text = self.symptomArray[indexPath.row];
        cell.statusImageView.image = [self stateForCellSelect:indexPath]?SymSelectImage:SymEmptyImage;
        return cell;
        
    }


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SecondarySymptomTableViewCell *cell = (SecondarySymptomTableViewCell *)[self.SecondSymTableView cellForRowAtIndexPath:indexPath];
    NSString *selectCellString = self.symptomArray[indexPath.row];
    if ([self.selectSymArray containsObject:selectCellString]) {
        cell.statusImageView.image = SymEmptyImage;
        [self.selectSymArray removeObject:selectCellString];
    }
    else {
        cell.statusImageView.image = SymSelectImage;
        [self.selectSymArray addObject:selectCellString];
    }
}

- (BOOL)stateForCellSelect:(NSIndexPath*)indexPath {
    return [self.selectSymArray containsObject:self.symptomArray[indexPath.row]];
}
@end
