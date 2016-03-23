//
//  HomeSubViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/22.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "HomeSubViewController.h"

@interface HomeSubViewController ()
@property (strong, nonatomic) IBOutlet UIButton *diseaseButton;
@property (strong, nonatomic) IBOutlet UIButton *fitnessButton;
@property (strong, nonatomic) IBOutlet UIButton *checkButton;
@property (strong, nonatomic) IBOutlet UIButton *userButton;
@property (weak, nonatomic) IBOutlet UIImageView *scrollImageView;

@end

@implementation HomeSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self layoutForView];
}

- (void)layoutForView {
    
        UIView *superview = self.view;
        [self.diseaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollImageView.mas_bottom); //with is an optional semantic filler
        make.left.equalTo(superview.mas_left);
        make.right.equalTo(superview.mas_centerX);
        make.width.equalTo(make.height);
    }];
    
    [self.fitnessButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollImageView.mas_bottom); //with is an optional semantic filler
        make.left.equalTo(superview.centerX);
        make.right.equalTo(superview.mas_right);
        make.width.equalTo(make.height);
    }];
    
    [self.checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.diseaseButton.mas_bottom); //with is an optional semantic filler
        make.left.equalTo(superview.mas_left);
        make.right.equalTo(superview.mas_centerX);
        make.width.equalTo(make.height);
    }];
    
    [self.userButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fitnessButton.mas_bottom); //with is an optional semantic filler
        make.left.equalTo(superview.centerX);
        make.right.equalTo(superview.right);
        make.width.equalTo(make.height);
    }];
}

@end
