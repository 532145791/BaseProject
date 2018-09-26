//
//  TabBarViewController.m
//  Daixiong(Buyer)
//
//  Created by 冷超 on 2017/4/17.
//  Copyright © 2017年 冷超. All rights reserved.
//

#import "TabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabbarView];
    [self setUpChildViewController];
}

#pragma mark - 设置tabbar
-(void)setTabbarView{
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setTranslucent:NO];
    // 设置 TabBarItemTestAttributes 的颜色。
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],
                                                        NSForegroundColorAttributeName : [UIColor colorWithHexString:@"333333"]
                                                        } forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],
                                                        NSForegroundColorAttributeName : [UIColor colorWithHexString:@"333333"]
                                                        } forState:UIControlStateSelected];
}

#pragma mark - 创建控制器
- (void)setUpChildViewController{
    BaseNavigationViewController *firstVC = [[BaseNavigationViewController alloc] initWithRootViewController:[[FirstViewController alloc] init]];
    BaseNavigationViewController *secondVC = [[BaseNavigationViewController alloc] initWithRootViewController:[[SecondViewController alloc] init]];
    BaseNavigationViewController *thirdVC = [[BaseNavigationViewController alloc] initWithRootViewController:[[ThirdViewController alloc] init]];
    
    [self addOneChildViewController:firstVC
                          WithTitle:@"首页"
                          imageName:@"first-normal"
                  selectedImageName:@"first-selected"];
    
    [self addOneChildViewController:secondVC
                          WithTitle:@"发现"
                          imageName:@"second-normal"
                  selectedImageName:@"second-selected"];
    
    
    [self addOneChildViewController:thirdVC
                          WithTitle:@"我的"
                          imageName:@"third-normal"
                  selectedImageName:@"third-selected"];
}

#pragma mark - 添加一个子控制器
- (void)addOneChildViewController:(UIViewController *)viewController WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItemL = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    viewController.tabBarItem = tabBarItemL;
    viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    
    [self addChildViewController:viewController];
}

@end
