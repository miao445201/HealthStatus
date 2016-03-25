//
//  ImageRollScrollView.h
//  StuManagement
//
//  Created by MiY on 16/3/24.
//  Copyright © 2016年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface ImageRollScrollView : UIView <UIScrollViewDelegate>

- (void)loadImages:(NSArray *)images withRollTime:(NSTimeInterval)time optionalText:(NSArray *)texts;

@end
