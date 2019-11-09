//
// WeChatServiceManager.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/26
// Time: 17:13
//
// Copyright © 2019 cocoawork. All rights reserved.

#import <Foundation/Foundation.h>
#import "WeChatHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeChatServiceManager : NSObject

+ (instancetype)shareManager;

+ (CGroupMgr *)groupManager;

+ (AccountStorageMgr *)accountManager;

@end

NS_ASSUME_NONNULL_END
