//
//  LCSegmentedControl.m
//  Daixiong(Buyer)
//
//  Created by 冷超 on 2017/4/25.
//  Copyright © 2017年 冷超. All rights reserved.
//

#import "LCSegmentedControl.h"

@implementation LCSegmentedControl
{
    NSArray *_titleArr;
    UILabel *_line;
    UIScrollView *_scrollView;
}

-(instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr{
    self = [super initWithFrame:frame];
    if (self) {
        _titleArr = [NSArray arrayWithArray:titleArr];
    }
    return self;
}

-(void)configUI{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(Adapt_Width(22), 0, Screen_Width - Adapt_Width(22)*2, self.frame.size.height)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    CGFloat itemHeight = self.frame.size.height - 2;
    CGFloat totalWidth = 0;
    CGFloat space = Adapt_Width(30);
    UIButton *tmpBtn;
    for (NSInteger i = 0; i < _titleArr.count ; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:_titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:_unSelectedColor forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:_textFont];
        btn.tag = i;
        [btn sizeToFit];
        btn.frame = CGRectMake(totalWidth, 0, btn.width, itemHeight);
        [btn addTarget:self action:@selector(tapItem:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:btn];
        totalWidth = totalWidth + btn.width + space;
        
        if (i == _selectedIndex) {
            [btn setTitleColor:_selectedColor forState:UIControlStateNormal];
            tmpBtn = btn;
        }
    }
    
    _line = [[UILabel alloc] initWithFrame:CGRectMake(0, itemHeight, tmpBtn.width, 2)];
    _line.center = CGPointMake(tmpBtn.centerX, _line.centerY);
    _line.backgroundColor = _lineColor;
    [_scrollView addSubview:_line];
    
    [self addSubview:_scrollView];
    [_scrollView setContentSize:CGSizeMake(totalWidth, 0)];
}

-(void)tapItem:(UIButton *)btn{
    _selectedIndex = btn.tag;
    for (UIView *subBtn in _scrollView.subviews) {
        if ([subBtn isKindOfClass:[UIButton class]]) {
            UIButton *b = (UIButton *)subBtn;
            if (b.tag == _selectedIndex) {
                [b setTitleColor:_selectedColor forState:UIControlStateNormal];
            }else{
                [b setTitleColor:_unSelectedColor forState:UIControlStateNormal];
            }
        }
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint point = _line.center;
        point.x = btn.center.x;
        _line.center = point;
    }];
    
    if ([_delegate respondsToSelector:@selector(segmentSelectedIndex:)]) {
        [_delegate segmentSelectedIndex:btn.tag];
    }
}

@end
