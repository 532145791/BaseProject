//
//  NSObject+Extend.m
//  BaseProject
//
//  Created by NeverMore on 2017/9/6.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "NSObject+Extend.h"

@implementation NSObject (Extend)

-(UIViewController *)getCurrentVC {
    return  [self topController];
}

- (UIViewController *)topController {
    
    UIViewController *topC = [self topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (topC.presentedViewController) {
        topC = [self topViewController:topC.presentedViewController];
    }
    return topC;
}

- (UIViewController *)topViewController:(UIViewController *)controller {
    if ([controller isKindOfClass:[UINavigationController class]]) {
        return [self topViewController:[(UINavigationController *)controller topViewController]];
    } else if ([controller isKindOfClass:[UITabBarController class]]) {
        return [self topViewController:[(UITabBarController *)controller selectedViewController]];
    } else {
        return controller;
    }
}
@end
