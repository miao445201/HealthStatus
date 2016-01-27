//
//  MenuViewController.h
//  HealthStatus
//
//  Created by fitfun on 16/1/27.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"

@interface MenuViewController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, weak) ICSDrawerController *drawer;

@end
