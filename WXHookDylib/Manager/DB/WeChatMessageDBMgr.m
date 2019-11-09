//
// WeChatMessageDBMgr.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/27
// Time: 16:35
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "WeChatMessageDBMgr.h"

@implementation WeChatMessageDBMgr

+ (instancetype)messageDBMgr
{
    static WeChatMessageDBMgr *mgr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [WeChatMessageDBMgr curretnAccountDBManager];
    });
    return mgr;
}

- (NSString *)databaseName
{
    return @"MM.sqlite";
}




@end
