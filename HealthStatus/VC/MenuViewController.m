//
//  MenuViewController.m
//  HealthStatus
//
//  Created by fitfun on 16/1/27.
//  Copyright © 2016年 缪宇青. All rights reserved.
//

#import "MenuViewController.h"

static NSString * const kMenuTableViewCellReuseId = @"kMenuTableViewCellReuseId";
@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UITableView *MenuTableView;
@property(nonatomic, assign) NSInteger previousRow;
@property (nonatomic,strong) NSArray *menu;
@property (weak, nonatomic) IBOutlet UIImageView *IconImageView;

@end

@implementation MenuViewController

- (void)setIcon {
    self.IconImageView.image = [UIImage imageNamed:@"01.jpg"];
    self.IconImageView.layer.masksToBounds = YES;
    self.IconImageView.layer.cornerRadius = self.IconImageView.bounds.size.width * 0.5;
    self.IconImageView.layer.borderWidth = 5.0;
    self.IconImageView.layer.borderColor = [UIColor whiteColor].CGColor;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setIcon];
    self.MenuTableView.dataSource = self;
    self.MenuTableView.delegate = self;
    [self.MenuTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kMenuTableViewCellReuseId];
    self.MenuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.menu = @[@"转换风格",@"给我评分",@"使用说明",@"收藏"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Configuring the view’s layout behavior

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // Even if this view controller hides the status bar, implementing this method is still needed to match the center view controller's
    // status bar style to avoid a flicker when the drawer is dragged and then left to open.
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMenuTableViewCellReuseId
                                                            forIndexPath:indexPath];
    cell.textLabel.text = self.menu[indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.backgroundColor = self.colors[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.previousRow) {
        // Close the drawer without no further actions on the center view controller
        [self.drawer close];
    }
    else {
        // Reload the current center view controller and update its background color
        typeof(self) __weak weakSelf = self;
        [self.drawer reloadCenterViewControllerUsingBlock:^(){
//            NSParameterAssert(weakSelf.colors);
//            weakSelf.drawer.centerViewController.view.backgroundColor = weakSelf.colors[indexPath.row];
        }];
        
        //        // Replace the current center view controller with a new one
        //        ICSPlainColorViewController *center = [[ICSPlainColorViewController alloc] init];
        //        center.view.backgroundColor = [UIColor redColor];
        //        [self.drawer replaceCenterViewControllerWithViewController:center];
    }
    self.previousRow = indexPath.row;
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

@end
