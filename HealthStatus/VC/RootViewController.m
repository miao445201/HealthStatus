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
@property (strong,nonatomic) NSArray *bodyArray;
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
    self.bodyTableview.delegate = self;
    self.bodyTableview.dataSource = self;
}

- (void)rightItemTapped {
    [self.view addSubview:self.listView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bodyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"BodyTableViewCell";
    
    //初始化cell并指定其类型，也可自定义cell
    
    BodyTableViewCell *cell = (BodyTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BodyTableViewCell" owner:self options:nil] lastObject];
    }
    cell.bodyLabel.text = self.bodyArray[indexPath.row];
            
    return cell;
}
@end
