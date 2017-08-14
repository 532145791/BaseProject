//
//  BaseViewController.m
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "BaseViewController.h"

static NSInteger btnWidth = 33;
static NSInteger btnHeight = 44;
@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = BackGround_Color;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

-(void)setNavigationWithTitle:(NSString *)title{
    [self setNavigationBar];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    if (title) {
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = title;
        titleLabel.font = [UIFont fontWithName:Font_PingFang_Semibold size:17];
        [titleLabel setTextColor:[UIColor colorWithHexString:@"4a4a4a"]];
        [titleLabel sizeToFit];
        self.navigationItem.titleView = titleLabel;
    }
}

-(void)setNavigationWithTitle:(NSString *)title showBackBtn:(BOOL)isShow{
    [self setNavigationWithTitle:title];
    if (isShow) {
        [self setLeftBtnWithImageName:BlackBackImage];
    }
}

-(void)setLeftBtnWithImageName:(NSString *)imageName{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, btnWidth, btnHeight);
    [leftBtn addTarget:self action:@selector(touchLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 20)];
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBar;
}

-(void)setNavigationBar{
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#333333"]];
    [self hiddenNavigationShadowImage];
    //    //解决 从有导航界面push无导航界面时，导航出现黑色背景的bug
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 隐藏导航下面的那根线
-(void)hiddenNavigationShadowImage{
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

#pragma mark - 点击左边按钮
-(void)touchLeftBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 点击右边按钮
-(void)touchRightBtn{
    //在子类中实现
}

#pragma mark - 控制屏幕旋转方法
//是否自动旋转,返回YES可以自动旋转,返回NO禁止旋转
- (BOOL)shouldAutorotate{
    return NO;
}

//返回支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

//由模态推出的视图控制器 优先支持的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

@end
