//
//  AppDelegate+AppService.m
//  BaseProject
//
//  Created by super on 2018/1/23.
//  Copyright © 2018年 lengchao. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import <Bugly/Bugly.h>
@implementation AppDelegate (AppService)
-(void)setUpHUDStyle{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setCornerRadius:2.0];
    [SVProgressHUD setFont:[UIFont fontWithName:Font_PingFang_Regular size:14.0]];
}

-(void)setUpBugly{
    [Bugly startWithAppId:Bugly_AppId];
}
@end
