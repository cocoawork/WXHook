//
// HomeFeatureGroupCell.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 10:53
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "HomeFeatureGroupCell.h"
#import "HomeFeatureCollectionViewCell.h"

@interface HomeFeatureGroupCell ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic, strong)UICollectionViewFlowLayout *layout;
@end

@implementation HomeFeatureGroupCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layout = [[UICollectionViewFlowLayout alloc] init];
        
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HomeFeatureCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
        [self.contentView addSubview:self.collectionView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    _layout.minimumLineSpacing = 10;
    _layout.minimumInteritemSpacing = 10;
    _layout.sectionInset = UIEdgeInsetsMake(20, 15, 20, 15);
    CGFloat itemWidth = (self.contentView.frame.size.width-_layout.sectionInset.left*2-_layout.minimumInteritemSpacing*2)/3;
    CGSize itemsize = CGSizeMake(itemWidth, itemWidth*1.2);
    _layout.itemSize = itemsize;
    [_collectionView reloadData];
}


- (void)setCellModel:(HomeFeatureGroupCellModel *)cellModel
{
    _cellModel = cellModel;
    [self.collectionView reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellModel.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeFeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.cellModel = self.cellModel.items[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.cellDidSelectedHandler) {
        _cellDidSelectedHandler(self.cellModel.items[indexPath.item]);
    }
}


@end
