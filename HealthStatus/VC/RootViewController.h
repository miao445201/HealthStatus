//
//  RootViewController.h
//  HealthStatus
//
//  Created by 缪宇青 on 16/1/24.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "BodyTableViewCell.h"
#import "SymptomTableViewCell.h"
#import "SecondarySymptomViewController.h"
#import "BaseMenuViewController.h"

@interface RootViewController :BaseMenuViewController<UITableViewDataSource,UITableViewDelegate>

@end
