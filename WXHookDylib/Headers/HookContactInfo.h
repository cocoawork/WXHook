//
// ContactInfo.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/28
// Time: 10:04
//
// Copyright © 2019 cocoawork. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HookContactInfo : NSObject

@property(nonatomic, copy)NSString *wxid;
@property(nonatomic, copy)NSString *headImgUrl;
@property(nonatomic, copy)NSString *displayName;
@property(nonatomic, strong)NSArray<HookContactInfo*> *members;

@property(nonatomic, assign, readonly)BOOL isChatRoom;

@end

NS_ASSUME_NONNULL_END
