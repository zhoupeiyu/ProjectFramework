//
//  BaseTableViewController.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/11.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)dealloc {
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
}
- (void)setupUI {
    [self.view addSubview:self.tableView];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}
- (void)enableRefreshHeader:(BOOL)enabled {
    [self enableRefreshHeader:enabled refreshSelector:@selector(reloadData)];
}


- (void)enableRefreshHeader:(BOOL)enabled refreshSelector:(SEL)selector {
    if (nil == self.tableView.mj_header) {
        LXRefreshDIYHeader *header = [LXRefreshDIYHeader headerWithRefreshingTarget:self refreshingAction:selector];
        self.tableView.mj_header = header;
    }
    self.tableView.mj_header.hidden = !enabled;
}
- (void)enableLoadMore:(BOOL)enabled selector:(SEL)selector {
    if (enabled) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:selector];
        [footer setTitle:@"加载更多" forState:MJRefreshStateIdle];
        [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
        self.tableView.mj_footer = footer;
    }
    else {
        self.tableView.mj_footer = nil;
    }
}
- (void)endHeadRefreshing {
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
}
- (void)endFootRefreshing {
    if ([self.tableView.mj_footer isRefreshing]) {
        [self.tableView.mj_footer endRefreshing];
    }
}
#pragma mark - lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [BaseTheme baseViewColor];
        _tableView.contentInset = UIEdgeInsetsZero;
    }
    return _tableView;
}
@end
