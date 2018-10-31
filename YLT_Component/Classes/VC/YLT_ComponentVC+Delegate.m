//
//  YLT_ComponentVC+Delegate.m
//  YLT_Component
//
//  Created by 项普华 on 2018/10/31.
//

#import "YLT_ComponentVC+Delegate.h"
#import "YLT_BaseComponentCell.h"
#import "YLT_BaseModel+Component.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@interface YLT_ComponentVC (CollectionDelegate)<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation YLT_ComponentVC (Delegate)

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_BaseModel *data = self.list[indexPath.section];
    CGFloat width = (YLT_SCREEN_WIDTH-data.ylt_leftMargin-data.ylt_rightMargin-data.ylt_spacing*(data.ylt_countPreRow-1))/data.ylt_countPreRow;
    CGFloat height = width/data.ylt_ratio;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    YLT_BaseModel *data = self.list[section];
    return UIEdgeInsetsMake(data.ylt_topMargin, data.ylt_leftMargin, data.ylt_bottomMargin, data.ylt_rightMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    YLT_BaseModel *data = self.list[section];
    return data.ylt_spacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    YLT_BaseModel *data = self.list[section];
    return data.ylt_spacing;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.list.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    YLT_BaseModel *data = self.list[section];
    if ([data.ylt_dataSource isKindOfClass:[NSArray class]]) {
        return ((NSArray *) data.ylt_dataSource).count;
    }
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_BaseModel *data = self.list[indexPath.section];
    YLT_BaseComponentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:data.ylt_cellClassName forIndexPath:indexPath];
    if ([data.ylt_dataSource isKindOfClass:[NSArray class]]) {
        data = [((NSArray *) data.ylt_dataSource) objectAtIndex:indexPath.row];
    }
    cell.componentData = data;
    return cell;
}

@end
