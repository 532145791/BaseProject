//
//  LocationTool.h
//  BaseProject
//
//  Created by 冷超 on 2017/8/1.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface LocationTool : NSObject<CLLocationManagerDelegate>
+(instancetype)sharedTool;
-(void)getLocation:(void (^)(CLPlacemark *placeMark))completion;
@end
