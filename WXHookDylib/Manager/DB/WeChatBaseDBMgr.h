//
// DatabaseManager.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/27
// Time: 09:55
//
// Copyright © 2019 cocoawork. All rights reserved.

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface WeChatBaseDBMgr : NSObject

@property(nonatomic, strong, readonly)FMDatabase *db;

+ (instancetype)curretnAccountDBManager;

@end

NS_ASSUME_NONNULL_END
