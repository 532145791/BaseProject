//
//  UIViewController+Extension.m
//  BaseProject
//
//  Created by NeverMore on 2017/8/15.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)
-(void)setNavigationBarColor:(UIColor *)color alpha:(CGFloat)alpha{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[color colorWithAlphaComponent:alpha > 0.95f ? 0.95f : alpha]] forBarMetrics:UIBarMetricsDefault];
//    if (self.navigationController.viewControllers.count > 1) {
//        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 64)];
//        view.backgroundColor = color; [self.view addSubview:view];
//    }
}
@end
