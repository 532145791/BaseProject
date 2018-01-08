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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[color colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = alpha<1;
    self.navigationController.navigationBar.shadowImage = alpha<1? [UIImage new] : nil;
}

-(UIView *)lightGray_line{
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.1];
    return line;
}

@end
