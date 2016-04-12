//
//  InspectionTableViewCell.h
//  HealthStatus
//
//  Created by fitfun on 16/3/19.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InspectionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIProgressView *diseaseProgressView;
@property (strong, nonatomic) IBOutlet UILabel *diseaseNameLabel;

@end
