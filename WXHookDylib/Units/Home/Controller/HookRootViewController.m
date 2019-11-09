//
// HookRootViewController.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 09:27
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "HookRootViewController.h"
#import "HomeFeatureGroupCell.h"
#import "HomeFeatureCellModel.h"
#import "HomeFeatureGroupCellModel.h"

#import "GameGroupViewController.h"


@interface HookRootViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic, strong)UICollectionViewFlowLayout *layout;
@property(nonatomic, strong)NSArray<HomeFeatureGroupCellModel*>*dataSource;

@end

@implementation HookRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationView setHidden:YES];
    [self configData];
    [self.view addSubview:self.collectionView];
    //hook_desktop.jpg
    
}





- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    _layout.itemSize = self.view.bounds.size;
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.collectionView.bounds];
    imgView.image = HookBundleImage(@"hook_desktop", @"jpg");
    self.collectionView.backgroundView = imgView;
    
}

- (void)configData
{
    
    HomeFeatureCellModel *m1 = [HomeFeatureCellModel cellModelWithIcon:[UIImage imageNamed:@"icon"] title:@"游戏群" clazz:nil];
    HomeFeatureCellModel *m2 = [HomeFeatureCellModel cellModelWithIcon:[UIImage imageNamed:@"icon"] title:@"游戏群" clazz:nil];
    HomeFeatureCellModel *m3 = [HomeFeatureCellModel cellModelWithIcon:[UIImage imageNamed:@"icon"] title:@"游戏群" clazz:nil];
    HomeFeatureCellModel *m4 = [HomeFeatureCellModel cellModelWithIcon:[UIImage imageNamed:@"icon"] title:@"游戏群" clazz:nil];
    HomeFeatureCellModel *m5 = [HomeFeatureCellModel cellModelWithIcon:[UIImage imageNamed:@"icon"] title:@"游戏群" clazz:nil];
    HomeFeatureCellModel *m6 = [HomeFeatureCellModel cellModelWithIcon:[UIImage imageNamed:@"icon"] title:@"游戏群" clazz:nil];
    HomeFeatureCellModel *m7 = [HomeFeatureCellModel cellModelWithIcon:[UIImage imageNamed:@"icon"] title:@"游戏群" clazz:nil];
    HomeFeatureCellModel *m8 = [HomeFeatureCellModel cellModelWithIcon:[UIImage imageNamed:@"icon"] title:@"游戏群" clazz:nil];
    HomeFeatureCellModel *m9 = [HomeFeatureCellModel cellModelWithIcon:[UIImage imageNamed:@"icon"] title:@"游戏群" clazz:nil];

    HomeFeatureGroupCellModel *g = [HomeFeatureGroupCellModel cellModelWithItems:@[m1,m2,m3,m4,m5,m6,m7,m8,m9]];
    self.dataSource = @[g];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeFeatureGroupCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    item.cellModel = self.dataSource[indexPath.item];
    item.cellDidSelectedHandler = ^(HomeFeatureCellModel *cellModel) {
        NSLog(@"选择了item");
        GameGroupViewController *gameVC = [[GameGroupViewController alloc] init];
        [self.navigationController showViewController:gameVC sender:nil];
    };
    return item;
}




#pragma mark - getter

- (UICollectionViewFlowLayout *)layout
{
    if (!_layout) {
        self.layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
        _layout.sectionInset = UIEdgeInsetsZero;
    }
    return _layout;
}


- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HomeFeatureGroupCell class] forCellWithReuseIdentifier:@"item"];
    }
    return _collectionView;
}



@end
