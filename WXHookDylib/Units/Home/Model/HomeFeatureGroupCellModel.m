//
// HomeFeatureGroupCellModel.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 11:03
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "HomeFeatureGroupCellModel.h"

@implementation HomeFeatureGroupCellModel

+ (instancetype)cellModelWithItems:(NSArray<HomeFeatureCellModel*>*)items
{
    return [[self alloc] initWithItems:items];
}

- (instancetype)initWithItems:(NSArray<HomeFeatureCellModel*>*)items
{
    if (self = [super init]) {
        self.items = [NSArray arrayWithArray:items];
    }
    return self;
}

@end
