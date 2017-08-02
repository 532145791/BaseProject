//
//  LCSegmentedControl.h
//  Daixiong(Buyer)
//
//  Created by 冷超 on 2017/4/25.
//  Copyright © 2017年 冷超. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LCSegmentedControlDelegate <NSObject>

-(void)segmentSelectedIndex:(NSInteger)index;

@end

@interface LCSegmentedControl : UIView
-(instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr;
-(void)configUI;
@property (weak , nonatomic) id <LCSegmentedControlDelegate> delegate;
@property UIColor *selectedColor;//选中之后的颜色
@property UIColor *unSelectedColor;//未选中的颜色
@property UIColor *lineColor;//下划线的颜色
@property CGFloat textFont;//字体大小
@property NSInteger selectedIndex;//默认选中哪个
@end
