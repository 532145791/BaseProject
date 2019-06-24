

//--------------******** 宏定义 ********--------------//

#ifndef AppMacroDefine_h
#define AppMacroDefine_h

#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

#define NoKnowError @"抱歉，服务器出错，请重试"
#define DismissTime 1
#define BackGround_Color Color(@"ffffff")
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Adapt_Width(x) ((x) * [UIScreen mainScreen].bounds.size.width / 375.0)
#define Adapt_Height(x) ((x) * [UIScreen mainScreen].bounds.size.height / 667.0)
#define System_Version [[[UIDevice currentDevice] systemVersion] floatValue]
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// 判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//是否为X
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//底部距离
#define Home_Indicator ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 83.0 : 49.0)
//导航栏高度
#define KNavigationBar_HEIGHT ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 88.0 : 64.0)


//字体
#define Font_Semibold(fontValue)  [UIFont fontWithName:@"PingFangSC-Semibold"  size:fontValue]
#define Font_Light(fontValue)  [UIFont fontWithName:@"PingFangSC-Light"  size:fontValue]
#define Font_Regular(fontValue)  [UIFont fontWithName:@"PingFangSC-Regular"  size:fontValue]
#define Font_Medium(fontValue)  [UIFont fontWithName:@"PingFangSC-Medium"  size:fontValue]

//颜色
#define Color(colorHex) [UIColor colorWithHexString:colorHex]
#define Color_alpha(colorHex,alpha) [UIColor colorWithHexString:colorHex alpha:alpha]

#endif /* AppMacroDefine_h */
