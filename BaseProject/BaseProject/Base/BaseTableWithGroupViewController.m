//
//  BaseTableWithGroupViewController.m
//  BaseProject
//
//  Created by NeverMore on 2017/12/6.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "BaseTableWithGroupViewController.h"

@interface BaseTableWithGroupViewController ()

@end

@implementation BaseTableWithGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 添加下拉刷新（需要在子类中调用）
-(void)setRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
}

#pragma mark - 下拉刷新执行的方法
-(void)refresh{
    //在子类中实现
}

#pragma mark - 添加上拉加载更多（需要在子类中调用）
-(void)setLoadMoreData{
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

#pragma mark - 上拉执行的方法
-(void)loadMoreData{
    //在子类中实现
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - 要在子类中设置table view frame
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
