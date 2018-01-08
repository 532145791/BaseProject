//
//  AutorotateViewController.m
//  BaseProject
//
//  Created by NeverMore on 2017/12/6.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "AutorotateViewController.h"

@interface AutorotateViewController ()

@end

@implementation AutorotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationShowBackBtnWithNavigationTitle:@"屏幕旋转"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (BOOL)shouldAutorotate{
//    //是否允许转屏
//    return YES;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    //viewController所支持的全部旋转方向
//    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return UIInterfaceOrientationLandscapeRight;
//}

@end
