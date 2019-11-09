//
// WeChatContactDatabaseMgr.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/27
// Time: 16:34
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "WeChatBaseDBMgr.h"

NS_ASSUME_NONNULL_BEGIN

@class HookContactInfo;
@interface WeChatContactDBMgr : WeChatBaseDBMgr

+ (instancetype)contactDBMgr;

- (HookContactInfo *)getContactByUserName:(NSString *)username;

@end

NS_ASSUME_NONNULL_END
