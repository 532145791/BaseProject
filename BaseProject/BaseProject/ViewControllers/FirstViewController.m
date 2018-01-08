//
//  FirstViewController.m
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "FirstViewController.h"
#import "AutorotateViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self setNavigationWithTitle:@"第一"];
    //导航透明
//    self.navigationController.navigationBar.translucent = YES;
    //
//    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.rowHeight = 45;
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 200, 100, 50);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
}

-(void)push{
//    [self.navigationController pushViewController:[AutorotateViewController new] animated:YES];
    [self basePushViewController:[AutorotateViewController new] animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }   cell.textLabel.text = @"导航渐变";
    return cell;
}

/**
 实现渐变
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    float alpha = 1 - ((64 - scrollView.contentOffset.y) / 64);
//    [self setNavigationBarColor:[UIColor redColor] alpha:alpha];
}

@end
