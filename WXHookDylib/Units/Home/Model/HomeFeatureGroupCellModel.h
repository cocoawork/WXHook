//
// HomeFeatureGroupCellModel.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 11:03
//
// Copyright © 2019 cocoawork. All rights reserved.

#import <Foundation/Foundation.h>
#import "HomeFeatureCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeFeatureGroupCellModel : NSObject

@property(nonatomic, strong)NSArray<HomeFeatureCellModel*> *items;

+ (instancetype)cellModelWithItems:(NSArray<HomeFeatureCellModel*>*)items;

- (instancetype)initWithItems:(NSArray<HomeFeatureCellModel*>*)items;

@end

NS_ASSUME_NONNULL_END
