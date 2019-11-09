//
// HookTableViewController.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 15:00
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "HookBaseViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface HookTableViewController : HookBaseViewController

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)RETableViewManager *tableViewManager;

@end

NS_ASSUME_NONNULL_END
