//
//  BaseScrollViewController.m
//  BaseProject
//
//  Created by 冷超 on 2017/8/1.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "BaseScrollViewController.h"

@interface BaseScrollViewController ()

@end

@implementation BaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = BackGround_Color;
    }
    return _scrollView;
}

-(UIView *)containerView{
    if (!_containerView) {
        _containerView = [UIView new];
        [self.scrollView addSubview:_containerView];
        [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.width.equalTo(self.scrollView);
        }];
    }
    return _containerView;
}

@end
