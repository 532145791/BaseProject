//
//  BaseViewController.m
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "BaseViewController.h"

static NSInteger leftBtnWidth = 50;
static NSInteger leftBtnHeight = 44;
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
        UILabel *titleLabel=[[UILabel alloc]init];
        titleLabel.text= title;
        [titleLabel setFont:[UIFont boldSystemFontOfSize:ViewTitleSize]];
        [titleLabel setTextColor:[UIColor colorWithHexString:@"333333"]];
        [titleLabel sizeToFit];
        self.navigationItem.titleView=titleLabel;
    }
}

-(void)setNavigationWithTitle:(NSString *)title leftBtnWithTitle:(NSString *)leftTitle{
    [self setNavigationWithTitle:title];
    
    if (leftTitle) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftBtnWidth, leftBtnHeight)];
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *imgtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchLeftBtn)];
        [view addGestureRecognizer:imgtap];
        
        UILabel *lab = [[UILabel alloc] init];
        lab.text = leftTitle;
        lab.textColor = [UIColor colorWithHexString:@"333333"];
        lab.font = [UIFont systemFontOfSize:NavigationLeftOrRightItemFont];
        [lab sizeToFit];
        lab.frame = CGRectMake(0, (view.frame.size.height - lab.frame.size.height)/2, lab.frame.size.width, lab.frame.size.height);
        [view addSubview:lab];
        
        UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:view];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -6;//这个数值可以根据情况自由变化
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,leftBar];
    }else{
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftBtnWidth, leftBtnHeight)];
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *imgtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchLeftBtn)];
        [view addGestureRecognizer:imgtap];
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(0, 11, 22, 22);
        imgView.image = [UIImage imageNamed:@"nav-black-back"];
        [view addSubview:imgView];
        
        UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:view];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -6;//这个数值可以根据情况自由变化
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,leftBar];
    }
}

-(void)setNavigationWithTitle:(NSString *)title rightBtnWithImageName:(NSString *)imageName leftBtnWithTitle:(NSString *)leftTitle{
    [self setNavigationWithTitle:title leftBtnWithTitle:leftTitle];
    
    if (imageName) {
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        img.userInteractionEnabled = YES;
        UITapGestureRecognizer *imgtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchRightBtn)];
        [img addGestureRecognizer:imgtap];
        
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = 0;//这个数值可以根据情况自由变化
        
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:img];
        self.navigationItem.rightBarButtonItems = @[negativeSpacer,right];
    }
    
}

-(void)setNavigationWithTitle:(NSString *)title rightBtnWithTitle:(NSString *)rightTitle leftBtnWithTitle:(NSString *)leftTitle{
    [self setNavigationWithTitle:title leftBtnWithTitle:leftTitle];
    
    if (rightTitle) {
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightBtn setTitle:rightTitle forState:UIControlStateNormal];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:NavigationLeftOrRightItemFont];
        [rightBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        [rightBtn sizeToFit];
        [rightBtn addTarget:self action:@selector(touchRightBtn) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -12;//这个数值可以根据情况自由变化
        
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
        self.navigationItem.rightBarButtonItems = @[negativeSpacer,right];
    }
}

-(void)setNavigationWithTitle:(NSString *)title rightBtnWithImageName:(NSString *)rightImageName leftBtnWithImageName:(NSString *)leftImageName{
    [self setNavigationWithTitle:title];
    
    if (rightImageName) {
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:rightImageName]];
        img.userInteractionEnabled = YES;
        UITapGestureRecognizer *imgtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchRightBtn)];
        [img addGestureRecognizer:imgtap];
        
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = 0;//这个数值可以根据情况自由变化
        
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:img];
        self.navigationItem.rightBarButtonItems = @[negativeSpacer,right];
    }
    
    if (leftImageName) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftBtnWidth, leftBtnHeight)];
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *imgtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchLeftBtn)];
        [view addGestureRecognizer:imgtap];
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(0, 11, 22, 22);
        imgView.image = [UIImage imageNamed:leftImageName];
        [view addSubview:imgView];
        
        UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:view];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -6;//这个数值可以根据情况自由变化
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,leftBar];
    }
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
