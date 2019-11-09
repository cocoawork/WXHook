//
// WeChatServiceManager.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/26
// Time: 17:13
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "WeChatServiceManager.h"
#import <objc/objc-runtime.h>


@implementation WeChatServiceManager



+ (CGroupMgr *)groupManager{
    MMServiceCenter *serviceCenter = [objc_getClass("MMServiceCenter") defaultCenter];
    return [serviceCenter getService:objc_getClass("CGroupMgr")];
}


+ (AccountStorageMgr *)accountManager
{
        MMServiceCenter *serviceCenter = [objc_getClass("MMServiceCenter") defaultCenter];
        return [serviceCenter getService:objc_getClass("AccountStorageMgr")];
}

@end
