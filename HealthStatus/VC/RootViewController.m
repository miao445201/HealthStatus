//
//  RootViewController.m
//  HealthStatus
//
//  Created by 缪宇青 on 16/1/24.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headButton;
@property (weak, nonatomic) IBOutlet UIButton *chestButton;
@property (weak, nonatomic) IBOutlet UIButton *abdomenButton;
@property (weak, nonatomic) IBOutlet UIButton *urinaryButton;
@property (weak, nonatomic) IBOutlet UIButton *leftHandButton;
@property (weak, nonatomic) IBOutlet UIButton *rightHandButton;
@property (weak, nonatomic) IBOutlet UIButton *leftLegButton;
@property (weak, nonatomic) IBOutlet UIButton *rightLegButton;
@property (weak, nonatomic) IBOutlet UILabel *showClickLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bodyImageView;

@property (weak, nonatomic) IBOutlet UITableView *bodyTableview;
@property (strong, nonatomic) IBOutlet UIView *listView;
@property (weak, nonatomic) IBOutlet UITableView *symptomTableview;
@property (strong,nonatomic) NSArray *bodyArray;
@property (strong,nonatomic) NSMutableArray *dataSymptomArray;
@property (strong,nonatomic) NSMutableArray *selectSymptomArray;
@property (strong,nonatomic) NSMutableDictionary *dataDictionary;


@property (strong, nonatomic) NSString *selectBodyString;
@property BOOL  forwardSelect;
@property BOOL  bodySelect;
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
    self.bodyArray = [[NSArray alloc]initWithObjects:@"头",@"脑",@"眼",@"咽喉",@"鼻",@"耳",@"口",@"面部",@"颈",@"胸",@"腹",@"腰",@"臀",@"上肢",@"手部",@"肩部",@"下肢",@"大腿",@"膝部",@"小腿",@"足部",@"骨",@"生殖",@"盆腔",@"全身",@"肌肉",@"淋巴",@"血液血管",@"皮肤",@"心理",@"背部", nil];
    self.dataSymptomArray = [[NSMutableArray alloc]initWithObjects:@"咳嗽",@"头痛",@"头晕",@"脸上长斑",@"牙龈出血",@"口干舌燥",@"扁桃体发炎",@"眼睑浮肿",@"干咳",@"耳后淋巴结肿大",@"咳痰",@"眼屎多", nil];
    
    self.dataDictionary = [[NSMutableDictionary alloc]init];
    [self.dataDictionary setValue:self.dataSymptomArray forKey:@"头"];
    [self.dataDictionary setValue:[[NSMutableArray alloc]initWithObjects:@"咳嗽",@"心悸",@"胸痛",@"胸闷",@"呼吸困难",@"心率过缓",@"腰酸背痛",@"胸骨后疼痛",@"肩背痛",@"心慌气短", nil] forKey:@"胸"];
    [self.dataDictionary setValue:[[NSMutableArray alloc]initWithObjects:@"咳嗽",@"心悸",@"胸痛",@"胸闷",@"呼吸困难",@"心率过缓",@"腰酸背痛",@"胸骨后疼痛",@"肩背痛",@"心慌气短", nil] forKey:@"腹"];
    [self.dataDictionary setValue:[[NSMutableArray alloc]initWithObjects:@"性欲减退",@"尿道局部肿胀", nil] forKey:@"生殖"];
    [self.dataDictionary setValue:[[NSMutableArray alloc]initWithObjects:@"四肢无力",@"肩膀酸痛",@"上肢麻痹",@"手热",@"四肢麻木",@"指甲异常",@"偏瘫",@"肢体冰凉", nil] forKey:@"上肢"];
    [self.dataDictionary setValue:[[NSMutableArray alloc]initWithObjects:@"脚臭",@"小腿酸痛",@"水肿",@"大腿内侧红斑",@"大腿刺痛",@"打软腿",@"四肢抽搐",@"下肢无力", nil] forKey:@"下肢"];
    [self.dataDictionary setValue:[[NSMutableArray alloc]initWithObjects:@"肩痛",@"肩关节活动受损", nil] forKey:@"肩部"];
    [self.dataDictionary setValue:[[NSMutableArray alloc]initWithObjects:@"背部酸痛", nil] forKey:@"背部"];
    [self.dataDictionary setValue:[[NSMutableArray alloc]initWithObjects:@"肛门疼痛",@"排便困难",@"直肠疼痛",@"骨盆痛",@"痔出血",@"排便时间过长",@"臀部酸痛", nil] forKey:@"臀"];


    


    
    self.selectBodyString = nil;
    [self.view addSubview:self.listView];
    self.listView.hidden = YES;
    self.bodySelect = YES;
    self.forwardSelect = YES;
    
    self.leftHandButton.transform =  CGAffineTransformRotate (self.leftHandButton.transform, M_PI/6);
    self.rightHandButton.transform = CGAffineTransformRotate(self.rightHandButton.transform, -M_PI/6);
    self.leftLegButton.transform =  CGAffineTransformRotate (self.leftLegButton.transform, M_PI/36);
    self.rightLegButton.transform = CGAffineTransformRotate(self.rightLegButton.transform, -M_PI/36);
    self.showClickLabel.text = @"当前选择部位";
    
    NSIndexPath *selectPath = [NSIndexPath indexPathForRow:[self.bodyArray indexOfObject:@"头"] inSection:0];
    [self tableView:self.bodyTableview didSelectRowAtIndexPath:selectPath];
    [self.bodyTableview scrollToRowAtIndexPath:selectPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)rightItemTapped {
    self.bodySelect = self.listView.hidden = !self.bodySelect;
    NSString *rightNavString = self.bodySelect?@"列表查看":@"部位图";
    [self setRightNaviItemWithTitle:rightNavString imageName:nil];
    
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
        static NSString *cellId = @"BodyTableViewCell";
        static NSString *selectCellId = @"SelectBodyTableViewCell";

        //判断cell是否是点击状态
        BOOL select = [self StateForCellSelect:indexPath];
        NSString *selectId = select?selectCellId:cellId;

        BodyTableViewCell *cell = (BodyTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:selectId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"BodyTableViewCell" owner:self options:nil] lastObject];
        }
        
        cell.bodyLabel.text = self.bodyArray[indexPath.row];
        cell.backgroundColor = select?kWhiteColor:kTableViewBarColor;
        return cell;
    }
    else {
        //初始化cell并指定其类型，也可自定义cell
        static NSString *CellIdentifier = @"SymptomTableViewCell";
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
        BodyTableViewCell *cell = (BodyTableViewCell *)[self.bodyTableview cellForRowAtIndexPath:indexPath];
        self.selectBodyString = self.bodyArray[indexPath.row];
        cell.backgroundColor = kWhiteColor;
        [self.bodyTableview reloadData];
        //数据请求操作，并旋转小菊花
        
        self.selectSymptomArray = [self.dataDictionary objectForKey:self.selectBodyString];
        [self.symptomTableview reloadData];
    }
    if (tableView == self.symptomTableview) {
        //进入下一页面
        SecondarySymptomViewController *secondSymVC = [[SecondarySymptomViewController alloc]init];
        secondSymVC.mainSymptom = self.selectSymptomArray[indexPath.row];
        [self.navigationController pushViewController:secondSymVC animated:YES];
    }
}

- (BOOL)StateForCellSelect:(NSIndexPath *)indexPath {
    return [self.bodyArray[indexPath.row] isEqualToString:self.selectBodyString];
}

#pragma IBAction Methods
- (IBAction)bodyClicked:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSString *bodyPart;
    switch (btn.tag) {
        case 1000:
            bodyPart = self.forwardSelect?@"头":@"颈";
            break;
        case 1001:
            bodyPart = @"头";
            break;
        case 1002:
            //反面是背部
            bodyPart = @"胸";
            bodyPart = self.forwardSelect?@"胸":@"背部";
            break;
        case 1003:
            //反面是背部
            bodyPart = self.forwardSelect?@"腹":@"背部";
            break;
        case 1004:
            //反面是臀部
            bodyPart = self.forwardSelect?@"生殖":@"臀";
            break;
        case 1005:
            bodyPart = @"下肢";
            break;
        case 1006:
            bodyPart = @"上肢";
            break;
        default:
            break;
    }
    self.showClickLabel.text = bodyPart;
    NSIndexPath *selectPath = [NSIndexPath indexPathForRow:[self.bodyArray indexOfObject:bodyPart] inSection:0];
    [self tableView:self.bodyTableview didSelectRowAtIndexPath:selectPath];
    [self.bodyTableview scrollToRowAtIndexPath:selectPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    [self rightItemTapped];
    
}

- (IBAction)switchButtonClicked:(id)sender {
    self.forwardSelect = !self.forwardSelect;
    self.bodyImageView.image =  self.forwardSelect?ForwardImage:BackImage;
}


@end
