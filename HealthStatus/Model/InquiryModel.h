//
//  InquiryModel.h
//  HealthStatus
//
//  Created by 缪宇青 on 16/4/12.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "BaseModel.h"

@interface InquiryModel : BaseModel

@property (nonatomic, copy) UIImage *inquiryImage;
@property (nonatomic, copy) NSString *inquiryTitle;
@property (nonatomic, copy) NSString *corePrompt;
@property (nonatomic, copy) NSString *releaseTime;
@property (nonatomic, copy) NSString *enjoyNumber;


@end
