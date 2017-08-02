//
//  BaseTableViewController.h
//  BaseProject
//
//  Created by 冷超 on 2017/8/1.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataArray;

/**
 添加下拉刷新
 */
-(void)setRefresh;
/**
 下拉刷新执行的方法
 */
-(void)refresh;

/**
 添加上拉加载更多
 */
-(void)setLoadMoreData;
/**
 上拉执行的方法
 */
-(void)loadMoreData;
@end
