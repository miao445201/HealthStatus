//
//  HSDBModel.m
//  HealthStatus
//
//  Created by fitfun on 16/1/26.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "HSDBModel.h"
#import "FMDatabase.h"

static  HSDBModel * s_Instance = nil;
#define DBNAME  @"HealthStatus.sqlite"

@interface HSDBModel() {
    @private
    FMDatabase* m_db;
}
@end
@implementation HSDBModel
+ (instancetype)GetInstance {
    if (nil != s_Instance) {
        return s_Instance;
    }
    s_Instance = [[HSDBModel alloc]init];
    s_Instance->m_db = nil;
    return s_Instance;
}

- (void)initDB {
    
    if (nil != m_db) {
        return;
    }
    
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath   = [docsPath stringByAppendingPathComponent:DBNAME];
    NSLog(@"==============================================%@",dbPath);
    m_db = [FMDatabase databaseWithPath:dbPath];
    
    if ([m_db open]) {
        NSString *CreateTablesql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS HS (PAGE INTEGER PRIMARY KEY AUTOINCREMENT,IMAGE TEXT UNIQUE,DETAIL TEXT UNIQUE)"];
        BOOL result = [m_db executeUpdate:CreateTablesql];
        if (result) {
            NSLog(@"建表成功");
        }
        else {
            NSLog(@"建表失败");
        }
    }
    else {
        NSLog(@"打开数据库失败");
    }
}

- (void)closeDB {
    if ( nil != m_db )
    {
        [m_db close];
        m_db = nil;
    }
}

//插入数据
- (void)insertWithDataArray:(NSMutableArray *)dataArray
{
//    for (imageModel *model in dataArray) {
//        [m_db executeUpdate:@"INSERT INTO PERI (IMAGE,DETAIL) VALUES (?, ?)",model.imageUrl,model.imageDetail];
//    }
}

//查询
- (NSMutableArray*)queryWithPage:(int)page
{
    // 1.执行查询语句
    NSString *pageCount = [NSString stringWithFormat:@"%d",30 * (page-1)];
    FMResultSet *resultSet = [m_db executeQuery:@"SELECT * FROM PERI LIMIT ?,30",pageCount];
    NSMutableArray *dataArray = [[NSMutableArray alloc]initWithCapacity:100];
    // 2.遍历结果
    while ([resultSet next]) {
//        imageModel *model = [[imageModel alloc]init];
//        model.imageUrl = [resultSet stringForColumn:@"IMAGE"];
//        model.imageDetail = [resultSet stringForColumn:@"DETAIL"];
//        [dataArray addObject:model];
    }
    return dataArray;
}

- (NSMutableArray*)queryRandom {
    // 1.执行查询语句
    FMResultSet *resultSet = [m_db executeQuery:@"select * from PERI order by random() limit 5 "];
    NSMutableArray *dataArray = [[NSMutableArray alloc]initWithCapacity:100];
    // 2.遍历结果
    while ([resultSet next]) {
//        imageModel *model = [[imageModel alloc]init];
//        model.imageUrl = [resultSet stringForColumn:@"IMAGE"];
//        model.imageDetail = [resultSet stringForColumn:@"DETAIL"];
//        [dataArray addObject:model];
    }
    return dataArray;
    
}

- (BOOL)execSql:(NSString *)sql
{
    if ( nil == m_db || nil == sql || 0 == sql.length )
    {
        return NO;
    }
    
    if ([m_db executeStatements:sql] )
    {
        return YES;
    }
    
    return NO;
}
@end
