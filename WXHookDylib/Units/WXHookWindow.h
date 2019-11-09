//
// WXHookWindow.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 09:21
//
// Copyright © 2019 cocoawork. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXHookWindow : UIWindow

@property(nonatomic, strong)id expendRootVC;
@property(nonatomic, strong)id closedRootVC;

+ (instancetype)defaultHookWindow;


@end

NS_ASSUME_NONNULL_END
