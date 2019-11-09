//
// HomeFeatureCollectionViewCell.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 10:42
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "HomeFeatureCollectionViewCell.h"

@interface HomeFeatureCollectionViewCell ()

@property(nonatomic, strong)UIImageView *iconImgView;
@property(nonatomic, strong)UILabel *titleLabel;

@end

@implementation HomeFeatureCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.iconImgView = [[UIImageView alloc] init];
        _iconImgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _iconImgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_iconImgView];
        
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(20);
    }];
    
    [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.titleLabel.mas_top);
    }];
    
}

- (void)setCellModel:(HomeFeatureCellModel *)cellModel
{
    _cellModel = cellModel;
    _iconImgView.image = _cellModel.icon;
    _titleLabel.text = _cellModel.title;
}

@end
