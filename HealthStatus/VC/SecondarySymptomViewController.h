//
//  SecondarySymptomViewController.h
//  HealthStatus
//
//  Created by fitfun on 16/3/16.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "BaseViewController.h"

@interface SecondarySymptomViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)   NSMutableArray *symptomArray;
@property (nonatomic,strong)   NSString *mainSymptom;
@end
