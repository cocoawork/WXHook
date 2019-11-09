//
// GlobalConfig.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 14:11
//
// Copyright © 2019 cocoawork. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GlobalConfig : NSObject

//hook浮动window 尺寸
@property(nonatomic, assign, readonly)CGRect floatWindowBounds;

+ (instancetype)shareInstance;


@end

NS_ASSUME_NONNULL_END
