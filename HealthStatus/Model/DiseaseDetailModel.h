//
//  DiseaseDetailModel.h
//  HealthStatus
//
//  Created by fitfun on 16/3/21.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface DiseaseDetailModel :BaseModel
@property (nonatomic, copy) NSString *diseaseDescption;
@property (nonatomic, copy) NSString *diseaseCrowd;
@property (nonatomic, copy) NSString *typicalSymptom;
@property (nonatomic, copy) NSString *inspection;
@property (nonatomic, copy) NSString *department;

@end
