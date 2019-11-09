//
// HookBaseViewController.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 11:50
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "HookBaseViewController.h"

@interface HookBaseViewController ()

@end

@implementation HookBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view setAutoresizesSubviews:YES];

}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    CGFloat width = [GlobalConfig shareInstance].floatWindowBounds.size.width;
    CGFloat height = [GlobalConfig shareInstance].floatWindowBounds.size.height;
    self.view.frame = CGRectMake(0, 0, width, height);
    
}
@end
