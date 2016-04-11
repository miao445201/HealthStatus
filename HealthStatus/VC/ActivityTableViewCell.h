//
//  ActivityTableViewCell.h
//  HealthStatus
//
//  Created by fitfun on 16/3/24.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *activityImageView;
@property (strong, nonatomic) IBOutlet UILabel *activityTitle;
@property (strong, nonatomic) IBOutlet UILabel *activityTime;

@end
