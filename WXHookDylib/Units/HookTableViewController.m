//
// HookTableViewController.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 15:00
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "HookTableViewController.h"

@interface HookTableViewController ()//<UITableViewDelegate, UITableViewDataSource>

@end

@implementation HookTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];

}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.navigationView.mas_bottom);
    }];
}


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return nil;
//}


- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *t = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//        t.dataSource = self;
//        t.delegate = self;
        t.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        if (@available(iOS 11.0, *)) {
            t.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView = t;
    }
    return _tableView;
}

- (RETableViewManager *)tableViewManager
{
    if (!_tableViewManager) {
        RETableViewManager *manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
        _tableViewManager = manager;
    }
    return _tableViewManager;
}

@end
