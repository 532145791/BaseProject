//
//  LCProgressHUD.m
//  ProjectXmall
//
//  Created by 冷超 on 2017/6/5.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import "LCProgressHUD.h"
static CGFloat MaxWidth = 250.0;
static CGFloat MinHeight = 45.0;
@implementation LCProgressHUD
{
    UILabel *_contentLab;
    UIView  *_bgView;
}
+ (LCProgressHUD*)sharedView {
    static dispatch_once_t once;
    static LCProgressHUD *sharedView;
    dispatch_once(&once, ^{ sharedView = [[self alloc] init]; });
    return sharedView;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.0];
        self.frame = [UIScreen mainScreen].bounds;
        [self configUI];
        self.alpha = 0.0f;
    }
    return self;
}

-(void)configUI{
    _bgView = [[UIView alloc] init];
    _bgView.layer.masksToBounds = YES;
    _bgView.layer.cornerRadius = 2.0;
    _bgView.backgroundColor = [UIColor colorWithHexString:@"010101" alpha:0.8];
    [self addSubview:_bgView];
    
    _contentLab = [[UILabel alloc] initWithFrame:CGRectZero];
    _contentLab.textColor = [UIColor colorWithHexString:@"ffffff"];
    _contentLab.font = [UIFont systemFontOfSize:14];
    _contentLab.textAlignment = NSTextAlignmentCenter;
    _contentLab.numberOfLines = 0;
    [self addSubview:_contentLab];
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(@(MaxWidth - 60));
        make.height.greaterThanOrEqualTo(@(MinHeight - 25));
        make.center.equalTo(self);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_contentLab).offset(-30);
        make.top.equalTo(_contentLab).offset(-12.5);
        make.right.equalTo(_contentLab).offset(30);
        make.bottom.equalTo(_contentLab).offset(12.5);
    }];
}

-(void)showHintMessageWithStatus:(NSString *)status dismissAfter:(NSInteger)second{
    _contentLab.text = status;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1.0;
    }];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [self handleOnMainQueueAfterSecond:second];
}

- (void)handleOnMainQueueAfterSecond:(NSInteger)second
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       [self removeFromSuperview];
                   });
}

@end
