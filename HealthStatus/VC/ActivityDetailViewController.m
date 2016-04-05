//
//  ActivityDetailViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/30.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "ActivityDetailViewController.h"

@interface ActivityDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UIView *introductionView;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *loveImageView;
@property BOOL isLike;
@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initScrollView];
}

- (void)initScrollView {
    //设置导航栏的背景照片为透明图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    self.isLike = NO;
    self.posterImageView.image = [UIImage imageNamed:@"sucai.jpg"];
    NSString *newsString = @"  浙江在线03月31日讯 春光明媚，万物复苏，正是植树好时节。3月，虹桥镇通过“e点爱”智慧公益平台众筹，在虹桥东排河两岸种下了5000多棵树。\n  今天，虹桥镇政府和乐清日报社“e点爱”工作室再次发起植树认捐活动，共同打造虹桥长大河绿色长廊。东排河绿色长廊建设项目从今年1月底启动以来，得到了社会各界的积极响应。市镇两级计划投资1500万元，建设东排河7.8公里河道沿线游步道、休闲公园、健身场所等配套设施，将东排河绿色长廊打造为虹桥镇生态休闲中心，争取今年底率先完成游步道的建设。项目负责人介绍，东排河绿色长廊带动了全镇市民爱护河流、保护环境的热情，很多个人和单位都表示要参与新一轮的植树活动。\n  虹桥镇第二期植树众筹活动——“长大河绿色长廊”植树认捐活动今天正式在“e点爱”智慧公益平台启动，为期30天。众筹活动结束后，将统一开展线下植树活动。虹桥长大河严宅至连桥段长3.5公里，两岸拟种植1500棵树，众筹30万元，将种植红皮榕树、丹桂、竹柏等树木。\n认捐细则:\n  1、面向全市众筹，每位市民、每个单位都可以认捐，树木的种植和日常养护由虹桥镇政府统一负责。\n  2、认捐的树木将冠以温馨的名字，如“爱情树”、“成长树”、“长寿树”等，树上挂有铜牌，上面可以镌刻爱人、父母、孩子、朋友的名字.\n  3、种植的树以水杉、丹桂为主，捐款金额为200元/棵。如果认捐1棵树，请在捐款金额里填写200元，认捐2棵树，填写400元，以此类推。\n认捐活动结束之后，工作人员将会及时和您对接。";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:17],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    self.detailTextView.attributedText = [[NSAttributedString alloc] initWithString:newsString attributes:attributes];
    [self.detailTextView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth - 16));
    }];
    
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth));
        make.bottom.equalTo(self.detailTextView.bottom);
    }];
    
    
    self.scrollView.delegate = self;
    self.scrollView.bounces = YES;
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.posterImageView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset = scrollView.contentOffset.y;
    if (yOffset < 0) {
        CGRect f = self.posterImageView.frame;
        f.origin.y = 0;
        f.size.height += -yOffset*10;
        self.posterImageView.frame = f;
    }
}

- (IBAction)loveButtonClicked:(id)sender {
    self.isLike = self.isLike?NO:YES;
    self.loveImageView.image = self.isLike?LikeImage:NotLikeImage;
}

@end
