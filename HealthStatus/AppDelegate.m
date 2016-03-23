//
//  AppDelegate.m
//  HealthStatus
//
//  Created by 缪宇青 on 16/1/24.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeSubViewController.h"
#import "RootViewController.h"
#import "ActivityViewController.h"
#import "MyHealthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];//设置窗口
     self.window.backgroundColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setBarTintColor:[UIColor  colorWithRed:30.f/255 green:158.f/255 blue:185.f/255 alpha:1.0f]];

    HomeSubViewController *homeVC = [[HomeSubViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    RootViewController *rootVC = [[RootViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    //nav.navigationBarHidden = YES;//是否隐藏导航栏

    MyHealthViewController *myHealthVC = [[MyHealthViewController alloc]init];
    UINavigationController *HealthNav = [[UINavigationController alloc] initWithRootViewController:myHealthVC];
    
    ActivityViewController *activityVC = [[ActivityViewController alloc]init];
    UINavigationController *activityNav = [[UINavigationController alloc] initWithRootViewController:activityVC];


    //a.初始化一个tabBar控制器
    UITabBarController *tabbarVC=[[UITabBarController alloc]init];
    tabbarVC.viewControllers = @[homeNav,HealthNav,activityNav];
    self.window.rootViewController = tabbarVC;//进入的首个页面

    //设置控制器为Window的根控制器
    [self.window makeKeyAndVisible];//显示
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
