//
//  DiseaseModel.h
//  HealthStatus
//
//  Created by fitfun on 16/3/21.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiseaseDetailModel.h"
#import "Mantle.h"

@interface DiseaseModel : NSObject<MTLJSONSerializing>

@property (nonatomic, copy) DiseaseDetailModel *diseaseInfo;
@property (nonatomic, copy) NSString *diseaseName;
@property  float progress;

@end
