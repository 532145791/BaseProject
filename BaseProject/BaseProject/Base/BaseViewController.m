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
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
    
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
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
        [titleLabel setTextColor:[UIColor colorWithHexString:@"000000"]];
        [titleLabel sizeToFit];
        self.navigationItem.titleView = titleLabel;
    }
}

-(void)setNavigationShowBackBtnWithNavigationTitle:(NSString *)title{
    [self setNavigationWithTitle:title];
    [self setLeftBtnWithImageName:BlackBackImage];
}

-(void)setLeftBtnWithImageName:(NSString *)imageName{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, btnWidth, btnHeight);
    [leftBtn addTarget:self action:@selector(touchLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBar;
}

//右侧为文字item的情况
- (void)addRightBarButtonItemWithTitle:(NSString *)itemTitle action:(SEL)action
{
    UIButton *rightbBarButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,88,44)];
    [rightbBarButton setTitle:itemTitle forState:(UIControlStateNormal)];
    [rightbBarButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    rightbBarButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightbBarButton addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    if (System_Version >= 11) {
        rightbBarButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
        [rightbBarButton setTitleEdgeInsets:UIEdgeInsetsMake(0,0,0, -5)];
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightbBarButton];
}

//右侧一个图片按钮的情况
- (void)addRightBarButtonWithImage:(UIImage *)firstImage action:(SEL)action
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,44,44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 44, 44);
    [firstButton setImage:firstImage forState:UIControlStateNormal];
    [firstButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (System_Version >= 11) {
        firstButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
        [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0,0,0, -5)];
    }
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:firstButton];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

-(void)setNavigationBar{
    //设置导航不透明
    self.navigationController.navigationBar.translucent = NO;
    //设置导航的背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"ffffff"]];
    //去掉导航下面的那根线
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];//设置透明的背景图，便于识别底部线条有没有被隐藏
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];//此处使底部线条失效
    //解决 从有导航界面push无导航界面时，导航出现黑色背景的bug
//    self.navigationController.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark - 点击左边按钮
-(void)touchLeftBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 点击右边按钮
-(void)touchRightBtn{
    //在子类中实现
}

-(void)basePushViewController:(UIViewController *)vc animated:(BOOL)animated{
    if (self.navigationController.viewControllers.count == 1) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:animated];
}

- (void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRoot{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToViewControllerAtIndex:(NSInteger)index{
    if (self.navigationController.viewControllers.count > index) {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index] animated:YES];
    }
}

- (void)dismissVC{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.tabBarController.tabBar.hidden = NO;
}

@end
