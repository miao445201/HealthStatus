//
//  MyHealthViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/3/22.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "MyHealthViewController.h"
#import "CollectionViewController.h"


@interface MyHealthViewController ()
@property(strong, nonatomic) HKHealthStore *healthStore;
@property (weak, nonatomic) IBOutlet UIImageView *headPhotoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *lineupImageView;
@property (weak, nonatomic) IBOutlet UIImageView *linedownImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lineleftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *linerightImageView;
@property (weak, nonatomic) IBOutlet UIView *healthDataView;
@property (weak, nonatomic) IBOutlet UILabel *footCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *energyLabel;
@property double currentFootCount;
@property double currentDistance;
@property double currentEnergy;

@end

@implementation MyHealthViewController
@synthesize healthStore;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的健康";
    [self getAuthorzation];
    [self loadSubviews];
}

- (void)loadSubviews {
    self.headPhotoImageView.layer.cornerRadius = self.headPhotoImageView.frame.size.width / 2;
    self.headPhotoImageView.clipsToBounds = YES;

}

- (void)getAuthorzation {
    if ((NSClassFromString(@"HKHealthStore") && [HKHealthStore isHealthDataAvailable])) {
        healthStore = [[HKHealthStore alloc] init];
        
        // Share body mass, height and body mass index
        NSSet *shareObjectTypes = [NSSet setWithObjects:
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                                   nil];
        
        // Read date of birth, biological sex and step count
        NSSet *readObjectTypes = [NSSet setWithObjects:
                                  [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
                                  [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
                                  [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                                  nil];        // Request access
        [healthStore requestAuthorizationToShareTypes:shareObjectTypes
                                            readTypes:readObjectTypes
                                           completion:^(BOOL success, NSError *error) {
                                               
                                               if(success == YES)
                                               {
                                                   //得到授权，可以获取数据
                                                   [self obtainData];
                                               }
                                               else
                                               {
                                                   //用户拒绝取得数据
                                               }
                                               
                                           }];
    }
    else {
        //健康healthkit不可用
    }
}

-(void)obtainData {
    // Set your start and end date for your query of interest
    NSDate *startDate, *endDate;
    NSDate *date = [NSDate date]; //获得时间对象
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone]; //获得系统的时区
    
    NSTimeInterval time = [zone secondsFromGMTForDate:date];//以秒为单位返回当前时间与系统格林尼治时间的差
    
    NSDate *dateNow = [date dateByAddingTimeInterval:time];//然后把差的时间加上,就是当前系统准确的时间
    
    endDate = dateNow;

    startDate = [self obtainZeroTime:dateNow];
    
    NSLog(@"%@-----%@",startDate,endDate);
    // Use the sample type for step count
    HKSampleType *sampleType = [HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    HKSampleType *distanceSampleType = [HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];
    HKSampleType *energysampleType = [HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];

    // Create a predicate to set start/end date bounds of the query
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionStrictStartDate];
    
    // Create a sort descriptor for sorting by start date
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:YES];
    
    
    HKSampleQuery *sampleQuery = [[HKSampleQuery alloc] initWithSampleType:sampleType
                                                                 predicate:predicate
                                                                     limit:HKObjectQueryNoLimit
                                                           sortDescriptors:@[sortDescriptor]
                                                            resultsHandler:^(HKSampleQuery *query, NSArray *results, NSError *error) {
                                                                
                                                                if(!error && results)
                                                                {
                                                                    for(HKQuantitySample *samples in results)
                                                                    {
                                                                        
                                                                        HKUnit *footUnit = [HKUnit unitFromString:@"count"];
                                                                            double footCount = [samples.quantity doubleValueForUnit:footUnit];
                                                                        self.currentFootCount += footCount;
                                                                    }
                                                                    NSLog(@"我今天到现在一共走了%f步",self.currentFootCount);
                                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                                        self.footCountLabel.text = [NSString stringWithFormat:@"%d",                                                                    (int)self.currentFootCount];                                                                    });
                                                                    

                                                                }
                                                                
                                                            }];
    HKSampleQuery *distancesampleQuery = [[HKSampleQuery alloc] initWithSampleType:distanceSampleType
                                                                 predicate:predicate
                                                                     limit:HKObjectQueryNoLimit
                                                           sortDescriptors:@[sortDescriptor]
                                                            resultsHandler:^(HKSampleQuery *query, NSArray *results, NSError *error) {
                                                                
                                                                if(!error && results)
                                                                {
                                                                    for(HKQuantitySample *samples in results)
                                                                    {
                                                                        
                                                                        HKUnit *distanceUnit = [HKUnit meterUnitWithMetricPrefix:HKMetricPrefixKilo];
                                                                        double distance = [samples.quantity doubleValueForUnit:distanceUnit];
                                                                        self.currentDistance += distance;
                                                                    }
                                                                    NSLog(@"我今天到现在一共走了%f公里",self.currentDistance);
                                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                                        self.distanceLabel.text = [NSString stringWithFormat:@"%.1f",                                                                    self.currentDistance];                                                                    });
                                                                    
                                                                }
                                                                
                                                            }];
    HKSampleQuery *energysampleQuery = [[HKSampleQuery alloc] initWithSampleType:energysampleType
                                                                 predicate:predicate
                                                                     limit:HKObjectQueryNoLimit
                                                           sortDescriptors:@[sortDescriptor]
                                                            resultsHandler:^(HKSampleQuery *query, NSArray *results, NSError *error) {
                                                                
                                                                if(!error && results)
                                                                {
                                                                    for(HKQuantitySample *samples in results)
                                                                    {
                                                                        
                                                                        HKUnit *energyUnit = [HKUnit unitFromString:@"kcal"];
                                                                        double energy = [samples.quantity doubleValueForUnit:energyUnit];
                                                                        self.currentEnergy += energy;
                                                                    }
                                                                    NSLog(@"我今天到现在一共花费了%f能量",self.currentEnergy);
                                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                                         self.energyLabel.text = [NSString stringWithFormat:@"%d",                                                                    (int)self.currentEnergy];                                                                    });
                  
                                                                }
                                                                
                                                            }];

    
    // Execute the query
    [healthStore executeQuery:sampleQuery];
    [healthStore executeQuery:distancesampleQuery];
    [healthStore executeQuery:energysampleQuery];

}

- (NSDate*)obtainZeroTime:(NSDate *)currentTime {
    NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    
    [calendar setTimeZone:gmt];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:currentTime];
    
    components.hour = 0;
    
    components.minute = 0;
    
    components.second = 0;
    
    return [calendar dateFromComponents:components];
}

#pragma IBAction Methods 
- (IBAction)myCollectionButtonClicked:(id)sender {
    CollectionViewController *collectionVC = [[CollectionViewController alloc]init];
    [self.navigationController pushViewController:collectionVC animated:YES];
}

- (IBAction)myActivityButtonClicked:(id)sender {
}


@end
