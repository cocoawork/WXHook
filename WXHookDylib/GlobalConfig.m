//
// GlobalConfig.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 14:11
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "GlobalConfig.h"

@implementation GlobalConfig

+ (instancetype)shareInstance
{
    static GlobalConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc] init];
    });
    return config;
}

- (instancetype)init
{
    if (self = [super init]) {
        CGRect bounds = [UIScreen mainScreen].bounds;
        CGFloat width = bounds.size.width/3*2;
        CGFloat height = width * (825/412);
        _floatWindowBounds = CGRectMake(0, 0, width, height);
    }
    return self;
}



@end
