//
// HomeFeatureGroupCell.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 10:53
//
// Copyright © 2019 cocoawork. All rights reserved.

#import <UIKit/UIKit.h>
#import "HomeFeatureGroupCellModel.h"

@class HomeFeatureCellModel;

typedef void(^HomeFeatureCollectionViewCellBlock)(HomeFeatureCellModel *cellModel);

@interface HomeFeatureGroupCell : UICollectionViewCell

@property(nonatomic, strong)HomeFeatureGroupCellModel *cellModel;

@property(nonatomic, copy)HomeFeatureCollectionViewCellBlock cellDidSelectedHandler;

@end

