//
//  LCProgressHUD.h
//  ProjectXmall
//
//  Created by 冷超 on 2017/6/5.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCProgressHUD : UIView
+ (LCProgressHUD*)sharedView;
-(void)showHintMessageWithStatus:(NSString *)status dismissAfter:(NSInteger)second;
@end
