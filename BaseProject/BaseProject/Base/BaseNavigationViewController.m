//
//  BaseNavigationViewController.m
//  BaseProject
//
//  Created by NeverMore on 2017/12/6.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "BaseViewController.h"
@interface BaseNavigationViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHidden = YES;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    BaseNavigationViewController* nvc = [super initWithRootViewController:rootViewController];
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
    nvc.delegate = self;
    return nvc;
}

//push方法  自动判断是否隐藏Tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[BaseViewController class]]) {
        BaseViewController *baseView = (BaseViewController *)viewController;
        NSDictionary *confDic = baseView.confDic;
        viewController.hidesBottomBarWhenPushed = [confDic[kTabbar_Hidden] boolValue];
    }
    [super pushViewController:viewController animated:animated];
}
@end
