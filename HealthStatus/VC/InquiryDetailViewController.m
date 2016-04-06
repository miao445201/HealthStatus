//
//  InquiryDetailViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/4/5.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "InquiryDetailViewController.h"
#define UILABEL_LINE_SPACE 6

@interface InquiryDetailViewController ()
{
    UIImageView *navBarHairlineImageView;
}
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextView *aritcleTextView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *mainPromptView;
@property (weak, nonatomic) IBOutlet UIScrollView *inquiryScrollView;
@property (strong, nonatomic)   UIImageView *shadowImageView;
@property BOOL isCollect;
@end

@implementation InquiryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    NSString *string = @"核心提示:超过一半的美国人每天喝咖啡超过18杯！";
    [self setLabelSpace:self.promptLabel withValue:string withFont:[UIFont systemFontOfSize:16.f]];
    self.isCollect = NO;
    [self setRightNaviItemWithTitle:nil imageName:@"Star-30.png"];
    NSString *newsString = @"超过一半的美国人每天喝咖啡超过18杯！\n如果你是个喜欢喝咖啡的人，如果你每天都冲煮咖啡，那么煮完咖啡之后的咖啡渣不要直接倒掉，因为这么好用的咖啡渣，又可以吸甲醛，又可以做菜、种花，倒掉之后你会后悔的！\n\n小提示，有些用途需要干燥的咖啡渣，若急着用的话，可以放在微波炉或焗炉中弄干，有些则是需要发酵之后使用效果更佳。\n\n1植物的肥料喷雾剂把半杯咖啡渣和温水混合在一起，放到喷壶里，每天直接对着植物喷一喷就好了。\n2改变绣球花的颜色绣球花颜色会受到土壤酸碱度不同进行变化，把咖啡渣撒在土上浇水，这样会让土壤PH值呈酸性，绣球花就会从粉色变成蓝色的~（家里有种绣球花的可以试试看欧）\n3让喵星人远离你的地盘喵星人是咖啡渣的anti饭，如果你邻居家的喵星人总是来刨你花园的植物的话，把咖啡渣混着橘子皮撒在花园周边就能顺利解决这个问题（前提是你要有个花园，另外不排除奇葩喵星人对咖啡渣or橘子皮着迷的￣▽￣'）\n4给汪星人洗澡、驱跳蚤在狗狗的沐浴露里加入一勺咖啡渣，顺着毛抹到皮肤上，之后冲洗干净，可以使你家狗狗“跳蚤去无踪，毛发更出众”。\n5给布料进行自然的染色步骤很简单，热水+咖啡渣，然后把白布扔进去煮一下就变成了浅棕色的布，而且颜色看起来非常自然。\n6刷碗咖啡本质上呈现弱酸性，可以替代洗碗布或金属钢丝球。只需抹布+几勺咖啡渣就可以轻松搞定残留的油腻污渍。\n7空气清新剂咖啡渣可以消除异味，把过滤剩下的咖啡渣收集起来，放在冰箱、鞋柜、厕所、厨房等有需要的地方，既可以消除异味还能散发咖啡香气。\n8修补家具的刮碰痕迹深色的木制家具可以用咖啡渣去除划痕。（当然太大的划痕是不行滴）\n9做旧家具用咖啡渣也可以把木头自然的做旧\n10脚臭的天敌将咖啡渣放在臭鞋里可以除臭，记得不要直接把咖啡渣扔在鞋里，还是装在纱布里用吧。\n11咖啡渣除异味涂在手上用热水冲洗，可以去除大蒜、海鲜、烧烤的气味。不知道你注意过没有，咖啡渣其实是可以吸收各种异味的，像家里装修有甲醛味道的，也同样可以收集咖啡渣来吸收异味，效果绝佳！\n12烹饪就烹饪而言，要用剩下的咖啡或新鲜的咖啡渣而非用过咖啡渣。用咖啡做嫩肉剂腌制牛排可调制上好的味道。还可以在冰淇淋、巧克力蛋糕加入新鲜的咖啡渣，会更美味。（当然也要适量欧）\n13制作手工咖啡蜡烛/手工皂动手能力不错的可以来尝试一下，咖啡渣是很好的材料。要知道，咖啡渣可是去除异味的好东西。\n14洗头可以亮发还除油，混合咖啡渣和润发乳，当润发乳用；或者一周一次，煮一壶咖啡，涂在洗干净了吹干了的头发上，20分钟后冲洗，长期坚持会有效果。用咖啡洗头对深褐色的头发有好处，还可以使头发变得更黑，更具光泽活力。\n15做面膜用咖啡渣做面膜，用1/4杯咖啡渣和蛋清混合，按摩，温水洗净，可以紧肤，缩毛孔。\n16画画你造吗？现在流行使用咖啡和茶的作画形式，经常煮咖啡，可以当做颜料画到卡片上。\n17替代口香糖的清新口气还在用薄荷味口香糖来清口？如果你牙口够好，出门前嚼一粒烘焙过的咖啡豆，完全不需要口香糖。\n18去死皮/去角质皮肤清洁过后，用橄榄油混合一些咖啡渣在皮肤上摩擦摩擦，去角质效果特别好。然后把咖啡渣洗洗掉，再涂抹一点乳液。也可以去死皮（干性皮肤，角质层薄的不推荐用欧）\n19去黑眼圈（熬夜人士必试）直接把咖啡渣敷在眼底，可以使你更清醒、充满活力20减肥1/4杯咖啡渣加一勺椰子油/橄榄油，以画圈圈的涂抹在想减肥的部位，腿部可以用包裹保鲜膜的方法，几分钟后洗净，每周两次，这个也是需要坚持看效果的";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:16],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    self.aritcleTextView.attributedText = [[NSAttributedString alloc] initWithString:newsString attributes:attributes];
    CGFloat articleHeight = 2500.f;
    CGRect rect = self.aritcleTextView.frame;
    rect.size.height = articleHeight;
    self.aritcleTextView.frame = rect;
    
    [self.titleView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth));
        make.top.equalTo(self.inquiryScrollView.top);
        make.height.equalTo(@60);
        make.left.equalTo(self.inquiryScrollView.left);
    }];
    
    [self.mainPromptView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.bottom).with.offset(10);
        make.left.equalTo(self.view.left).with.offset(15);
        make.right.equalTo(self.view.right).with.offset(-15);
        make.height.equalTo(@65);
    }];
    
    [self.aritcleTextView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainPromptView.bottom).with.offset(15);
        make.left.equalTo(self.view.left).with.offset(15);
        make.right.equalTo(self.view.right).with.offset(-15);
        make.height.equalTo(@(articleHeight));
    }];
    
    [self.inquiryScrollView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth));
        make.top.equalTo(self.view.top);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.bottom.equalTo(self.aritcleTextView.bottom);
    }];

}

- (void)rightItemTapped {
    self.isCollect = !self.isCollect;
    self.isCollect?[self setRightNaviItemWithTitle:nil imageName:@"Star Filled-30.png"]:[self setRightNaviItemWithTitle:nil imageName:@"Star-30.png"];
}

//导航栏去除黑线的方式（先通过查找navbar的子视图找到黑线的imageview，然后在进入时隐藏该视图，退出时再显示出来）
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    navBarHairlineImageView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    navBarHairlineImageView.hidden = NO;
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

//给UILabel设置行间距和字间距
-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}

//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, ScreenHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}
@end
