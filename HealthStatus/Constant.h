//
//  Constant.h
//  Peri
//
//  Created by fitfun on 15/11/9.
//  Copyright © 2015年 miao. All rights reserved.
//

//apple api
#define kAppAppleId         @"980883989"
#define kAppRateUrl         @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@"
#define kAppDownloadUrl     @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@&mt=8"
#define kNetWorkBaseUrl     @"http://httpbin.org/"

//Constant Values
#define kMaxCacheSize       1000*1024*1024
#define IsIos8              [[UIDevice currentDevice].systemVersion floatValue]>=8.0?YES:NO
#define IsDevicePhone4      [UIScreen mainScreen].bounds.size.height==480.f?YES:NO
#define IsDevicePhone5      [UIScreen mainScreen].bounds.size.height==568.f?YES:NO
#define IsDevicePhone6      [UIScreen mainScreen].bounds.size.height==667.f?YES:NO
#define IsDevicePhone6P     [UIScreen mainScreen].bounds.size.height==736.f?YES:NO
#define ScreenWidth         [UIScreen mainScreen].bounds.size.width
#define ScreenHeight        [UIScreen mainScreen].bounds.size.height
#define MAXOFFSET            1.5
#define kMainProjColor      [UIColor colorWithRed:63.f/255 green:172.f/255 blue:195.f/255 alpha:1.0f]
#define kMainBlackColor     [UIColor colorWithRed:30.f/255 green:30.f/255 blue:30.f/255 alpha:1.0f]
#define kLightTextColor     [UIColor colorWithRed:155.f/255 green:155.f/255 blue:155.f/255 alpha:1.0f]
#define kTableViewBarColor  [UIColor colorWithRed:245.f/255 green:245.f/255 blue:245.f/255 alpha:1.0f]
#define kWhiteColor         [UIColor whiteColor]
#define DOCUMENTS_FOLDER    [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/"]
#define SymSelectImage      [UIImage imageNamed:@"Checked-50.png"]
#define SymEmptyImage       [UIImage imageNamed:@"Active State-50.png"]
#define ForwardImage        [UIImage imageNamed:@"body.png"]
#define BackImage           [UIImage imageNamed:@"back.png"]
#define LikeImage           [UIImage imageNamed:@"Hearts Filled-40.png"]
#define NotLikeImage        [UIImage imageNamed:@"Hearts-40.png"]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define kCommonParamsDict   [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
#define kDeviceTokenKey     @"DeviceTokenKey"

#define kNetWorkErrorString @"当前网络不给力"
#define kLoginUserDataFile  @"LoginUserDataFile"
#define kCodeKey            @"status"
#define kMessageKey         @"message"
#define kSuccessCode        @"success"
#define kFailureCode        @"failure"
#define kUserIconCacheDir   @"UserIconCacheDir"
#define kFoodIconCacheDir   @"FoodIconCacheDir"
#define kUsersCacheDataDir  @"UsersCacheDataDir"
#define kSelectSymptomNotification       @"SelectSymptomNotification"
#define kReturnToHomeNotification       @"ReturnToHomeNotification"
#define kObtainWorkDataNotification     @"ObtainWorkDataNotification"
#define kReturnToActivityNotification     @"ReturnToActivityNotification"

//Notification Keys

//Url values
