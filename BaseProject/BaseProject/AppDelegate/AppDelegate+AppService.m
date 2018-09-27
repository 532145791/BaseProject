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
    [SVProgressHUD setFont:Font_Regular(14)];
}

-(void)setUpBugly{
    [Bugly startWithAppId:@""];
}
@end
