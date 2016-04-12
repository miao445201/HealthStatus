//
//  ActivityDetailViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/30.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "MBProgressHUD.h"

@interface ActivityDetailViewController ()<UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIView *attendView;
@property (weak, nonatomic) IBOutlet UIView *introductionView;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *loveImageView;
@property (weak, nonatomic) IBOutlet UIButton *attendButton;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;

@property BOOL isLike;
@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initScrollView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage = nil;
}
- (void)initScrollView {
    //self.navigationController.delegate = self;
    //设置导航栏的背景照片为透明图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    self.isLike = NO;
    
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.left.right.top.equalTo(self.view);
    }];
    
    NSString *newsString = @"  浙江在线03月31日讯 春光明媚，万物复苏，正是植树好时节。3月，虹桥镇通过“e点爱”智慧公益平台众筹，在虹桥东排河两岸种下了5000多棵树。\n  今天，虹桥镇政府和乐清日报社“e点爱”工作室再次发起植树认捐活动，共同打造虹桥长大河绿色长廊。东排河绿色长廊建设项目从今年1月底启动以来，得到了社会各界的积极响应。市镇两级计划投资1500万元，建设东排河7.8公里河道沿线游步道、休闲公园、健身场所等配套设施，将东排河绿色长廊打造为虹桥镇生态休闲中心，争取今年底率先完成游步道的建设。项目负责人介绍，东排河绿色长廊带动了全镇市民爱护河流、保护环境的热情，很多个人和单位都表示要参与新一轮的植树活动。\n  虹桥镇第二期植树众筹活动——“长大河绿色长廊”植树认捐活动今天正式在“e点爱”智慧公益平台启动，为期30天。众筹活动结束后，将统一开展线下植树活动。虹桥长大河严宅至连桥段长3.5公里，两岸拟种植1500棵树，众筹30万元，将种植红皮榕树、丹桂、竹柏等树木。\n认捐细则:\n  1、面向全市众筹，每位市民、每个单位都可以认捐，树木的种植和日常养护由虹桥镇政府统一负责。\n  2、认捐的树木将冠以温馨的名字，如“爱情树”、“成长树”、“长寿树”等，树上挂有铜牌，上面可以镌刻爱人、父母、孩子、朋友的名字.\n  3、种植的树以水杉、丹桂为主，捐款金额为200元/棵。如果认捐1棵树，请在捐款金额里填写200元，认捐2棵树，填写400元，以此类推。\n认捐活动结束之后，工作人员将会及时和您对接。";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:17],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    
    self.detailTextView.attributedText = [[NSAttributedString alloc] initWithString:newsString attributes:attributes];
        
    [self.posterImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top);
        make.height.equalTo(@325);
        make.width.equalTo(@(ScreenWidth));
        make.centerX.equalTo(self.view);
    }];
    
    self.posterImageView.image = self.selectImage;
    
    [self.introductionView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.posterImageView.bottom);
        make.height.equalTo(@183);
        make.width.equalTo(@(ScreenWidth));
    }];
    
    [self.detailTextView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.introductionView.bottom).offset(16);
        make.width.equalTo(@(ScreenWidth - 16));
        make.height.equalTo(@1200);
    }];
    
    [self.attendView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.equalTo(@49);
    }];
    
    [self.view layoutIfNeeded];
    CGFloat y = self.detailTextView.frame.origin.y + self.detailTextView.frame.size.height;
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.top).offset(y);
        make.left.right.equalTo(@0);
        make.height.equalTo(@1);
        make.width.equalTo(@(ScreenWidth));
    }];
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view).offset(70);
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
        
        CGFloat height = self.posterImageView.frame.size.height - yOffset*0.5;
        CGFloat width = ScreenWidth/325*height;
        [self.posterImageView remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.top);
            make.width.equalTo(@(width));
            make.height.equalTo(@(height));
            make.centerX.equalTo(self.view.centerX);
        }];
        
        [self.introductionView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.posterImageView.bottom);
            make.height.equalTo(@183);
            make.width.equalTo(@(ScreenWidth));
        }];
        
        [self.detailTextView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.introductionView.bottom).offset(16);
            make.width.equalTo(@(ScreenWidth - 16));
            make.height.equalTo(@1200);
        }];


    }
    else {
        [self.posterImageView remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.scrollView.top);
            make.width.equalTo(@(ScreenWidth));
            make.height.equalTo(@325);
        }];
    }
}

- (IBAction)loveButtonClicked:(id)sender {
    self.isLike = self.isLike?NO:YES;
    self.loveImageView.image = self.isLike?LikeImage:NotLikeImage;
    self.isLike?[self showHUBWithString:@"加入收藏成功"]:[self showHUBWithString:@"哼，不喜欢你了"];
}
- (IBAction)takepartinButtonClicked:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Set the label text.
    hud.labelText = @"正在报名中...";
    // You can also adjust other label properties if needed.
    // hud.label.font = [UIFont italicSystemFontOfSize:16.f];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [self doSomeWork];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
            [self.attendButton setTitle:@"报名成功" forState:UIControlStateNormal];
            self.attendButton.backgroundColor = [UIColor grayColor];
            self.attendButton.enabled = NO;
        });
    });
}

- (void)doSomeWork {
    // Simulate by just waiting.
    sleep(1.);
}
- (void)showHUBWithString:(NSString *)string {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    // Optional label text.
    hud.labelText = string;
    
    [hud hide:YES afterDelay:1.5f];
}


//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//
//    // 如果进入的是当前视图控制器
//    if (viewController == self) {
//        // 背景设置为黑色
//        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
//        // 透明度设置为0.3
//        //self.navigationController.navigationBar.alpha = 0.300;
//        // 设置为半透明
//        self.navigationController.navigationBar.translucent = YES;
//    } else {
//        // 进入其他视图控制器
//        self.navigationController.navigationBar.alpha = 1;
//        // 背景颜色设置为系统默认颜色
//        self.navigationController.navigationBar.barTintColor = [UIColor  colorWithRed:30.f/255 green:158.f/255 blue:185.f/255 alpha:1.0f];
//        self.navigationController.navigationBar.translucent = NO;
//    }
//}

@end
