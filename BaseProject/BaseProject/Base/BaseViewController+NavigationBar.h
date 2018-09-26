//
//  BaseViewController+NavigationBar.h
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "BaseViewController.h"

static NSString *const kNav_Hidden = @"nav_hidden";                 //导航条是否隐藏
static NSString *const kNav_Title = @"nav_title";                   //导航条title
static NSString *const kNav_TitleColor = @"nav_titleColor";         //导航条title颜色
static NSString *const kNav_TitleFont = @"nav_titleFont";           //导航条title字体大小
static NSString *const kNav_LeftButton = @"nav_leftButton";         //导航条左按钮
static NSString *const kNav_RightButton = @"nav_rightButton";       //导航条右按钮
static NSString *const kNav_LeftButtonTitle = @"nav_leftButtonTitle";         //导航条设置左按钮标题
static NSString *const kNav_RightButtonTitle = @"nav_rightButtonTitle";       //导航条设置右按钮标题
static NSString *const kNav_RightButtonTitleColor = @"nav_rightButtonTitleColor";       //导航条设置右按钮标题颜色
static NSString *const kNav_BackgroundColor = @"nav_backgroudColor";    //导航条背景色
static NSString *const kNav_GradientBackground = @"nav_gradientBackground";     //导航条渐变背景色
static NSString *const kTabbar_Hidden = @"tabbar_hidden";   //tabbar是否隐藏
static NSString* const kSwipe_Back =@"swipe_back";         //是否支持手势返回 yes 不支持

/**
 *  @author zengli, 18-05-11 10:07:06
 *
 *  导航栏左右按钮类型
 */
typedef NS_ENUM(NSInteger, MSNavBarItemType) {
    MSNavBarItemTypeNone = 0,
    MSNavBarItemTypeBack,   //返回
    MSNavBarItemTypeBack_White,
    MSNavBarItemTypeSearch,
    MSNavBarItemTypeMore,  //更多
    MSNavBarItemTypeEdite,  //编辑
    MSNavBarItemTypeHelp,   //帮助
    MSNavBarItemTypeShare,  //分享
    MSNavBarItemTypeRefresh,    //刷新
    MSNavBarItemTypeNews,   //消息 铃铛
    MSNavBarItemTypeGroup,  //群组
    MSNavBarItemTypeSetting,    //设置
    MSNavBarItemTypeAdd,    //添加
    MSNavBarItemTypeCamera,    //相机
    MSNavBarItemBlackTypeBack, //返回，黑按钮
    MSNavBarItemTypeWallet, //支付中心
};

@interface BaseViewController (NavigationBar)

// 初始化数据
- (void)initData;

// 初始化配置数据，设置导航栏左右按钮
- (void)initWithConfDic;

// 对navigationBar颜色设置
- (void)remarkNavigationBar;
//设置导航标题
-(void)resetNavigationTitle:(NSString *)title;

/**
 *  设置导航栏左按钮
 *  @param title 导航栏左按钮标题
 *  @param font  导航栏左按钮字体大小
 *  @param titleColor   导航栏左按钮文字颜色
 */
- (void)resetNavigationItemWithLeftTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor;

/**
 *  设置导航栏右按钮
 *  @param title 导航栏右按钮标题
 *  @param font  导航栏右按钮字体大小
 *  @param titleColor   导航栏右按钮文字颜色
 */
- (void)resetNavigationItemWithRightTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor;

/**
 *  根据导航栏类型设置左右按钮
 *  @param type 导航栏类型
 *  @param isLeftFlag YES：代表左按钮； NO：代表右按钮
 */
- (void)resetNavigationItemWithType:(MSNavBarItemType)type isLeft:(BOOL)isLeftFlag;

/**
 *  根据自定义view设置导航栏左右按钮
 *  @param leftView 左按钮自定义view
 *  @param rightView 右按钮自定义view
 */
- (void)resetNavigationItemWithLeftView:(UIView *)leftView rightView:(UIView *)rightView;

/**
 *  重置导航栏右边按钮栏，可以多个
 *  @param viewsArr 右按钮栏自定义view集合
 *  @param navigationSpacer 每个按钮间距
 */
- (void)resetNavigationItemsWithRightView:(NSArray *)viewsArr navigationSpacer:(CGFloat)navigationSpacer;

/**
 *  重置导航栏右边按钮栏，可以多个，默认间距 15
 *  @param viewsArr 右按钮栏自定义view集合
 */
- (void)resetNavigationItemsWithRightView:(NSArray *)viewsArr;

- (void)rightNavigationItemsDidClicked:(id)sender;

- (void)leftNavigationItemsDidClicked:(id)sender;
@end
