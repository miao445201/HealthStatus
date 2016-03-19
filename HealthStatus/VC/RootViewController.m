//
//  RootViewController.m
//  HealthStatus
//
//  Created by 缪宇青 on 16/1/24.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITableView *bodyTableview;
@property (strong, nonatomic) IBOutlet UIView *listView;
@property (weak, nonatomic) IBOutlet UITableView *symptomTableview;
@property (strong,nonatomic) NSArray *bodyArray;
@property (strong,nonatomic) NSMutableArray *selectSymptomArray;
@property (strong,nonatomic) BodyTableViewCell *selectCell;
@property (strong, nonatomic) NSString *selectBodyString;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initSomething];
}

- (void)initSomething {
    self.title = @"疾病自查";
    [self setRightNaviItemWithTitle:@"列表查看" imageName:nil];
    self.bodyArray = [[NSArray alloc]initWithObjects:@"头",@"脑",@"眼",@"咽喉",@"鼻",@"耳",@"口",@"面部",@"颈",@"胸",@"腹",@"腰",@"臀",@"上肢",@"手部",@"肩部",@"下肢",@"大腿",@"膝部",@"小腿",@"足部",@"骨",@"男性生殖",@"盆腔",@"全身",@"肌肉",@"淋巴",@"血液血管",@"皮肤",@"心理",@"背部", nil];
    self.selectSymptomArray = [[NSMutableArray alloc]initWithObjects:@"咳嗽",@"头痛",@"头晕", nil];
    self.selectCell = nil;
    self.selectBodyString = nil;
}

- (void)rightItemTapped {
    [self.view addSubview:self.listView];
}
- (void)reloadSymptomTableview:(NSNotification *)notification {
    NSString *selectBody = notification.object;
    //这里做数据请求的操作
    self.selectSymptomArray = [[NSMutableArray alloc] initWithObjects:selectBody, nil];
    [self.symptomTableview reloadData];
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.bodyTableview) {
        return self.bodyArray.count;
    }
    if (tableView == self.symptomTableview) {
        return self.selectSymptomArray.count;
    }
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.bodyTableview) {
        static NSString *CellIdentifier = @"BodyTableViewCell";
        static NSString *selectCellId = @"SelectBodyTableViewCell";
        //初始化cell并指定其类型，也可自定义cell
        BOOL select = [self.bodyArray[indexPath.row] isEqualToString:self.selectBodyString];
        NSString *selectId;
        if (select) {
            selectId = selectCellId;
        }
        else {
            selectId = CellIdentifier;
        }
        BodyTableViewCell *cell = (BodyTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:selectId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"BodyTableViewCell" owner:self options:nil] lastObject];
        }
        cell.bodyLabel.text = self.bodyArray[indexPath.row];
        
        return cell;

    }
    else {
        //初始化cell并指定其类型，也可自定义cell
        static NSString *CellIdentifier = @"SymptomTableViewCell";

        //初始化cell并指定其类型，也可自定义cell
        
        SymptomTableViewCell *cell = (SymptomTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SymptomTableViewCell" owner:self options:nil] lastObject];
        }
        cell.titleLabel.text = self.selectSymptomArray[indexPath.row];
        
        return cell;

    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.bodyTableview) {
//        BodyTableViewCell *cell = (BodyTableViewCell *)[self.bodyTableview cellForRowAtIndexPath:indexPath];
//        self.selectBodyString = self.bodyArray[indexPath.row];
//        if (self.selectCell) {
//            self.selectCell.backgroundColor = [UIColor groupTableViewBackgroundColor];
//        }
//        self.selectCell = cell;
//        cell.backgroundColor = [UIColor whiteColor];
//        NSString *bodyString = self.bodyArray[indexPath.row];
        //数据请求操作，并旋转小菊花
    }
    if (tableView == self.symptomTableview) {
        //进入下一页面
        SecondarySymptomViewController *secondSymVC = [[SecondarySymptomViewController alloc]init];
        [self.navigationController pushViewController:secondSymVC animated:YES];
    }
}

@end
