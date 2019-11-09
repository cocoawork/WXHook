//
// GameSysCenter.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 14:57
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "GameSysCenter.h"

@implementation GameSysCenter

+ (instancetype)defaultCenter
{
    static GameSysCenter *c = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        c = [[self alloc] init];
    });
    return c;
}

@end
