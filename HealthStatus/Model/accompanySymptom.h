//
//  accompanySymptom.h
//  HealthStatus
//
//  Created by 缪宇青 on 16/4/12.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "BaseModel.h"

@interface accompanySymptom : BaseModel

@property (nonatomic, copy) NSString *mainSymptom;
@property (nonatomic, copy) NSMutableArray *accompanySymptom;

@end
