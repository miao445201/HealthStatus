//
//  ActivityDetailViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/30.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "ActivityDetailViewController.h"

@interface ActivityDetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UIView *introductionView;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initScrollView];
}

- (void)initScrollView {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    
    //imageView
    self.posterImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sucai.jpg"]];
    self.posterImageView.frame = CGRectMake(0, 0, ScreenWidth, 183);
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

- (void)scaleImage{
    
}
@end
