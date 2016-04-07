//
//  AppDelegate.m
//  HealthStatus
//
//  Created by 缪宇青 on 16/1/24.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeSubViewController.h"
#import "MyHealthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];//设置窗口
     self.window.backgroundColor = [UIColor whiteColor];

    HomeSubViewController *homeVC = [[HomeSubViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeNav.title = @"首页";
    homeNav.tabBarItem.selectedImage =  [UIImage imageNamed:@"Home-25-2.png"];
    homeNav.tabBarItem.image =  [UIImage imageNamed:@"Home-25.png"];

    MyHealthViewController *myHealthVC = [[MyHealthViewController alloc]init];
    UINavigationController *HealthNav = [[UINavigationController alloc] initWithRootViewController:myHealthVC];
    HealthNav.title = @"我的健康";
    HealthNav.tabBarItem.selectedImage =  [UIImage imageNamed:@"Contacts-25-2.png"];
    HealthNav.tabBarItem.image =  [UIImage imageNamed:@"Contacts-25.png"];

    //a.初始化一个tabBar控制器
    UITabBarController *tabbarVC=[[UITabBarController alloc]init];
    tabbarVC.viewControllers = @[homeNav,HealthNav];
    self.window.rootViewController = tabbarVC;//进入的首个页面

    
    UIView *bgView = [[UIView alloc] initWithFrame:tabbarVC.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    lineImageView.image = [UIImage imageNamed:@"line_hon_1px_up.png"];
    [bgView addSubview:lineImageView];
    [tabbarVC.tabBar insertSubview:bgView atIndex:0];
    tabbarVC.tabBar.opaque = YES;    //设置控制器为Window的根控制器
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
