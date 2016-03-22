//
//  InspectionTableViewCell.m
//  HealthStatus
//
//  Created by fitfun on 16/3/19.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "InspectionTableViewCell.h"
@implementation InspectionTableViewCell

- (void)awakeFromNib {
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 5.0f);
    self.diseaseProgressView.transform = transform;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
