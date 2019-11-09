//
// HomeFeatureCellModel.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 11:00
//
// Copyright © 2019 cocoawork. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeFeatureCellModel : NSObject

@property(nonatomic, strong)UIImage *icon;
@property(nonatomic, copy)NSString *title;
@property(nonatomic, strong)Class clazz;

- (instancetype)initWithIcon:(UIImage *)icon title:(NSString *)title;
+ (instancetype)cellModelWithIcon:(UIImage *)icon title:(NSString *)title;
- (instancetype)initWithIcon:(UIImage *)icon title:(NSString *)title clazz:(Class)clazz;
+ (instancetype)cellModelWithIcon:(UIImage *)icon title:(NSString *)title clazz:(Class)clazz;


@end

NS_ASSUME_NONNULL_END
