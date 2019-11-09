//
// HomeFeatureCellModel.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 11:00
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "HomeFeatureCellModel.h"

@implementation HomeFeatureCellModel

- (instancetype)initWithIcon:(UIImage *)icon title:(NSString *)title
{
    if (self = [super init]) {
        _icon = icon;
        _title = title;
    }
    return self;
}


+ (instancetype)cellModelWithIcon:(UIImage *)icon title:(NSString *)title
{
    return [[self alloc] initWithIcon:icon title:title];
}

- (instancetype)initWithIcon:(UIImage *)icon title:(NSString *)title clazz:(Class)clazz
{
    if (self = [super init]) {
        _icon = icon;
        _title = title;
        _clazz = clazz;
    }
    return self;
}

+ (instancetype)cellModelWithIcon:(UIImage *)icon title:(NSString *)title clazz:(Class)clazz
{
    return [[self alloc] initWithIcon:icon title:title clazz:clazz];
}


@end
