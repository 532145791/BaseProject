//
//  FirstViewController.m
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "FirstViewController.h"
@interface FirstViewController ()
@end

@implementation FirstViewController

-(void)initData{
    self.confDic = @{kNav_Hidden: @(NO),
                     kNav_Title: @"First",
                     kNav_LeftButton: @(MSNavBarItemBlackTypeBack),
                     kNav_RightButton: @(MSNavBarItemTypeWallet),
                     kTabbar_Hidden: @(YES),
                     kNav_TitleColor: [UIColor colorWithHexString:@"333333"],
                     };
}

@end
