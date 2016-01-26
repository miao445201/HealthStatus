//
//  HSDBModel.h
//  HealthStatus
//
//  Created by fitfun on 16/1/26.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSDBModel : NSObject
+ (instancetype)GetInstance;

- (void)initDB;

- (void)closeDB;

- (void)insertWithDataArray:(NSMutableArray *)dataArray;

- (NSMutableArray*)queryWithPage:(int)page;

- (NSMutableArray*)queryRandom;

@end
