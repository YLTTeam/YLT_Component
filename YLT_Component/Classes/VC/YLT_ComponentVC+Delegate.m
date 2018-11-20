//
//  YLT_ComponentVC+Delegate.m
//  YLT_Component
//
//  Created by 项普华 on 2018/10/31.
//

#import "YLT_ComponentVC+Delegate.h"
#import "YLT_BaseComponentCell.h"
#import "YLT_ComponentModel.h"
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <YLT_Kit/YLT_Kit.h>

@interface YLT_ComponentVC (CollectionDelegate)<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation YLT_ComponentVC (Delegate)

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_ComponentModel *data = self.list[indexPath.section];
    CGFloat ratio = data.ylt_ratio;
    CGFloat width = (YLT_SCREEN_WIDTH-data.ylt_leftMargin-data.ylt_rightMargin-data.ylt_spacing*(data.ylt_countPreRow-1))/data.ylt_countPreRow;
    if (data.ylt_single) {//当为单行时，width为全屏幕
        width = (YLT_SCREEN_WIDTH-data.ylt_leftMargin-data.ylt_rightMargin);
    } else if ([data.ylt_dataSource isKindOfClass:[NSArray class]]){
        data = [((NSArray *) data.ylt_dataSource) objectAtIndex:indexPath.row];
        if (data.ylt_ratio != 0) {
            ratio = data.ylt_ratio;
        }
    }
    CGFloat height = width/ratio;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    YLT_ComponentModel *data = self.list[section];
    return UIEdgeInsetsMake(data.ylt_topMargin, data.ylt_leftMargin, data.ylt_bottomMargin, data.ylt_rightMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    YLT_ComponentModel *data = self.list[section];
    return data.ylt_spacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    YLT_ComponentModel *data = self.list[section];
    return data.ylt_spacing;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.list.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    YLT_ComponentModel *data = self.list[section];
    if (data.ylt_single) {
        return 1;
    }
    if ([data.ylt_dataSource isKindOfClass:[NSArray class]]) {
        return ((NSArray *) data.ylt_dataSource).count;
    }
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_ComponentModel *sectionData = self.list[indexPath.section];
    YLT_ComponentModel *data = sectionData;
    YLT_BaseComponentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:data.ylt_cellClassName forIndexPath:indexPath];
    if ([data.ylt_dataSource isKindOfClass:[NSArray class]]) {
        data = [((NSArray *) data.ylt_dataSource) objectAtIndex:indexPath.row];
    }
    
    cell.sectionData = sectionData;
    cell.componentData = data;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    YLT_ComponentModel *data = self.list[indexPath.section];
//    if ([data.ylt_dataSource isKindOfClass:[NSArray class]]) {
//        data = [((NSArray *) data.ylt_dataSource) objectAtIndex:indexPath.row];
//    }
}

@end
