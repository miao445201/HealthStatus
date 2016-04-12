//
//  InquiryTableViewCell.h
//  HealthStatus
//
//  Created by fitfun on 16/4/5.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InquiryTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *inquiryTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *inquiryCorePromptLabel;
@property (strong, nonatomic) IBOutlet UILabel *enjoyNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *releaseTimeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *inquiryImageView;

@end
