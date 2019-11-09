//
// ContactInfo.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/28
// Time: 10:04
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "HookContactInfo.h"

@implementation HookContactInfo

- (BOOL)isChatRoom
{
    return [self.wxid hasSuffix:@"@chatroom"];
}

@end
