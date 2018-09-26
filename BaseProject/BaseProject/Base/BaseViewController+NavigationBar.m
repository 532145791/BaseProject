//
//  BaseViewController+NavigationBar.m
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "BaseViewController+NavigationBar.h"

@implementation BaseViewController (NavigationBar)
#pragma mark - 初始化数据
- (void)initData
{
    self.confDic = @{kNav_Hidden: @(YES),
                     kNav_LeftButton: @(MSNavBarItemTypeBack),
                     kTabbar_Hidden: @(YES)
                     };
}

#pragma mark - 初始化配置数据，设置导航栏左右按钮
- (void)initWithConfDic
{
    BOOL navHidden = [self.confDic[kNav_Hidden] boolValue];
    
    [self.navigationController setNavigationBarHidden:navHidden animated:NO];
    
    self.navigationItem.title = self.confDic[kNav_Title];
    
    if ([self.confDic.allKeys containsObject:kNav_LeftButton]){
        MSNavBarItemType leftType = [self.confDic[kNav_LeftButton] integerValue];
        
        if (leftType > 0) {
            [self resetNavigationItemWithType:leftType isLeft:YES];
        }
    } else if ([self.confDic.allKeys containsObject:kNav_LeftButtonTitle]) {
        [self resetNavigationItemWithLeftTitle:self.confDic[kNav_LeftButtonTitle] font:nil titleColor:nil];
    }
    if ([self.confDic.allKeys containsObject:kNav_RightButton]){
        MSNavBarItemType rightType = [self.confDic[kNav_RightButton] integerValue];
        if (rightType > 0) {
            [self resetNavigationItemWithType:rightType isLeft:NO];
        }
    } else if ([self.confDic.allKeys containsObject:kNav_RightButtonTitle]) {
        [self resetNavigationItemWithRightTitle:self.confDic[kNav_RightButtonTitle] font:nil titleColor:self.confDic[kNav_RightButtonTitleColor]];
    }
}

-(void)resetNavigationTitle:(NSString *)title{
    self.navigationItem.title = title;
}

#pragma mark - 对navigationBar颜色设置
- (void)remarkNavigationBar
{
    [self initNavigationBarGradient:self.confDic[kNav_GradientBackground] backgroudColor:self.confDic[kNav_BackgroundColor]];
}

#pragma mark - 设置navigationBar样式
- (void)initNavigationBarGradient:(NSArray *)gradientArr backgroudColor:(UIColor *)backgroundColor
{
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    UIImage *gradientImage = nil;
    if (gradientArr.count > 0) {
        gradientImage = [UIImage gradientFromColors:gradientArr withFrame:CGRectMake(0, 0, Screen_Width, KNavigationBar_HEIGHT)];
    } else {
        if (backgroundColor) {
            gradientImage = [UIImage imageFromColor:backgroundColor];
        } else {
            gradientImage = [UIImage imageFromColor:[UIColor colorWithHexString:@"161616"]];
        }
    }
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithPatternImage:gradientImage];
    [self.navigationController.navigationBar setBackgroundImage:gradientImage forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.leftBarButtonItem.customView.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.customView.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.titleView.backgroundColor = [UIColor clearColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:(self.confDic[kNav_TitleFont] ? self.confDic[kNav_TitleFont] : Font_Semibold(18)),
       NSForegroundColorAttributeName:(self.confDic[kNav_TitleColor] ? self.confDic[kNav_TitleColor] : [UIColor whiteColor])}];
}

- (void)resetNavigationItemWithType:(MSNavBarItemType)navType orTitle:(NSString *)title orView:(UIView *)view atLeft:(BOOL)isLeft
{
    if (navType > 0) {
        [self resetNavigationItemWithType:navType isLeft:isLeft];
    } else if (title && title.length > 0) {
        if (isLeft) {
            [self resetNavigationItemWithLeftTitle:title font:nil titleColor:nil];
        } else {
            [self resetNavigationItemWithRightTitle:title font:nil titleColor:[UIColor colorWithHexString:kNav_RightButtonTitleColor]];
        }
    } else if (view) {
        if (isLeft) {
            [self resetNavigationItemWithLeftView:view rightView:nil];
        } else {
            [self resetNavigationItemWithLeftView:nil rightView:view];
        }
    }
}

#pragma mark - 设置导航栏左按钮
- (void)resetNavigationItemWithLeftTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor
{
    if(title && title.length > 0){
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftNavigationItemsDidClicked:)];
        [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:(font ? font : Font_Regular(15)),
                                                                        NSForegroundColorAttributeName:(titleColor ? titleColor : [UIColor colorWithHexString:@"333333"])} forState:UIControlStateNormal];
    }
}

#pragma mark - 设置导航栏右按钮
- (void)resetNavigationItemWithRightTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor
{
    if(title && title.length > 0){
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightNavigationItemsDidClicked:)];
        [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:(font ? font : Font_Regular(15)),
                                                                         NSForegroundColorAttributeName:(titleColor ? titleColor : [UIColor colorWithHexString:@"333333"])} forState:UIControlStateNormal];
    }
}

#pragma mark - 根据导航栏类型设置左右按钮
- (void)resetNavigationItemWithType:(MSNavBarItemType)type isLeft:(BOOL)isLeftFlag
{
    UIBarButtonItem *item = nil;
    if (type > 0) {
        UIImage *image = [UIImage imageNamed:[self navImageNameWithType:type]];
        if (image) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
            [btn setImage:image forState:UIControlStateNormal];
            [btn addTarget:self action:isLeftFlag?@selector(leftNavigationItemsDidClicked:):@selector(rightNavigationItemsDidClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, (isLeftFlag ? 0 : btn.width - image.size.width), 0, (isLeftFlag ? btn.width - image.size.width : 0))];
            item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        }
    }
    if (item) {
        if (isLeftFlag) {
            self.navigationItem.leftBarButtonItem = item;
        }else{
            self.navigationItem.rightBarButtonItem = item;
        }
    }
}

#pragma mark - 根据自定义view设置导航栏左右按钮
- (void)resetNavigationItemWithLeftView:(UIView *)leftView rightView:(UIView *)rightView
{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    if (leftView) {
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,[[UIBarButtonItem alloc] initWithCustomView:leftView]];
        if ([leftView isKindOfClass:[UIButton class]]) {
            UIButton *lButton = (UIButton *)leftView;
            [lButton addTarget:self action:@selector(leftNavigationItemsDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    if (rightView) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
        if ([rightView isKindOfClass:[UIButton class]]) {
            UIButton *rButton = (UIButton *)rightView;
            [rButton addTarget:self action:@selector(rightNavigationItemsDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

#pragma mark - 重置导航栏右边按钮栏，可以多个
- (void)resetNavigationItemsWithRightView:(NSArray *)viewsArr navigationSpacer:(CGFloat)navigationSpacer
{
    NSMutableArray *rightItems = [[NSMutableArray alloc] init];
    [viewsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx > 0) {
            UIBarButtonItem *navigationSpacerItem = [[UIBarButtonItem alloc]
                                                     initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                     target:nil action:nil];
            navigationSpacerItem.width = navigationSpacer;
            [rightItems addObject:navigationSpacerItem];
        }
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:obj];
        [rightItems addObject:rightItem];
    }];
    self.navigationItem.rightBarButtonItems = rightItems;
}

#pragma mark - 重置导航栏右边按钮栏，可以多个，默认间距 15
- (void)resetNavigationItemsWithRightView:(NSArray *)viewsArr
{
    [self resetNavigationItemsWithRightView:viewsArr navigationSpacer:15.0f];
}

#pragma mark - 导航栏左按钮action事件
- (void)leftNavigationItemsDidClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 导航栏右按钮action事件
- (void)rightNavigationItemsDidClicked:(id)sender
{
    
}

#pragma mark - 根据导航条类型获取icon名称
- (NSString *)navImageNameWithType:(MSNavBarItemType)navType{
    NSString *imageName = @"";
    switch (navType) {
        case MSNavBarItemTypeBack:
            imageName = @"fanhui";
            break;
            
        case MSNavBarItemTypeBack_White:
            imageName = @"nav_back_white";
            break;
        case MSNavBarItemTypeHelp:
            imageName = @"nav_help";
            break;
        case MSNavBarItemTypeEdite:
            imageName = @"nav_edite";
            break;
        case MSNavBarItemTypeMore:
            imageName = @"icon_course_detail_nav_more";
            break;
        case MSNavBarItemTypeSearch:
            imageName = @"nav_search_new";
            break;
        case MSNavBarItemTypeShare:
            imageName = @"nav_share";
            break;
        case MSNavBarItemTypeRefresh:
            imageName = @"nav_refresh";
            break;
        case MSNavBarItemTypeNews:
            imageName = @"nav_news";
            break;
        case MSNavBarItemTypeGroup:
            imageName = @"nav_group";
            break;
        case MSNavBarItemTypeSetting:
            imageName = @"nav_setting";
            break;
        case MSNavBarItemTypeAdd:
            imageName = @"nav_add";
            break;
        case MSNavBarItemTypeCamera:
            imageName = @"pf_camera";
            break;
        case MSNavBarItemBlackTypeBack:
            imageName = @"back_black";
            break;
        case MSNavBarItemTypeWallet:
            imageName = @"支付中心";
            break;
        default:
            break;
    }
    return imageName;
}
@end
