//
//  symptomModel.h
//  HealthStatus
//
//  Created by 缪宇青 on 16/4/12.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "BaseModel.h"

@interface symptomModel : BaseModel

@property (nonatomic, copy) NSString *bodyPart;
@property (nonatomic, copy) NSMutableArray *mainSymptom;

@end
