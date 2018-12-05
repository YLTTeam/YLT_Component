//
//  YLT_TopTabView.m
//  AFNetworking
//
//  Created by 项普华 on 2018/11/22.
//

#import "YLT_TopTabView.h"
#import "YLT_PalaceMenuView.h"

@interface YLT_TopTabView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
}
@property (nonatomic, strong) UICollectionView *mainCollectionView;
@end

@implementation YLT_TopTabView

@synthesize selectedIndex = _selectedIndex;
@synthesize selectedColor = _selectedColor;

/**
 生成顶部Tab
 
 @param titles 标题列表
 @param targetScrollView 下方的
 @return 顶部Tab
 */
+ (YLT_TopTabView *)ylt_topTabFromTitles:(NSArray<NSString *> *)titles
                        targetScrollView:(UIScrollView *)targetScrollView {
    YLT_TopTabView *result = [[YLT_TopTabView alloc] init];
    result.targetScrollView = targetScrollView;
    result.titles = titles;
    return result;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.ylt_width/MIN(5, MAX(self.titles.count, 1)), self.ylt_height);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titles.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_PalaceMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YLT_PalaceMenuCell.ylt_identify forIndexPath:indexPath];
    cell.mainView.menuType = MenuTypeOnlyTitle;
    cell.mainView.nameLabel.text = self.titles[indexPath.row];
    cell.mainView.nameLabel.textColor = (self.selectedIndex == indexPath.row) ? self.selectedColor : self.normalColor;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndex = indexPath.row;
    if (self.targetScrollView) {
        self.targetScrollView.contentOffset = CGPointMake(self.targetScrollView.ylt_width*_selectedIndex, 0);
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if (_selectedIndex != selectedIndex) {
        _selectedIndex = selectedIndex;
        __block NSInteger index = -1;/** 0:索引位置在显示中 1:索引位置比显示位置小  2:索引位置比显示位置大 */
        /** 通知外面进行移动 */
        [self.mainCollectionView.visibleCells enumerateObjectsUsingBlock:^(__kindof UICollectionViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            YLT_PalaceMenuCell *cell = obj;
            NSIndexPath *indexPath = [self.mainCollectionView indexPathForCell:cell];
            if (index != 0) {
                if (indexPath.row > selectedIndex) {
                    index = -1;
                } else if (indexPath.row < selectedIndex) {
                    index = 1;
                } else {
                    index = 0;
                }
            }
            cell.mainView.nameLabel.textColor = (indexPath.row == selectedIndex) ? self.selectedColor : self.normalColor;
        }];
        if (index > self.titles.count-1) {
            index = self.titles.count-1;
        }
        if (index != 0) {
            [self.mainCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_selectedIndex inSection:0] atScrollPosition:(index==-1)?UICollectionViewScrollPositionLeft:UICollectionViewScrollPositionRight animated:YES];
        }
    }
}

- (NSInteger)selectedIndex {
    if (_selectedIndex < 0) {
        return 0;
    }
    if (_selectedIndex >= self.titles.count) {
        return self.titles.count-1;
    }
    return _selectedIndex;
}

- (UIColor *)normalColor {
    if (!_normalColor) {
        _normalColor = @"CCCCCC".ylt_colorFromHexString;
    }
    return _normalColor;
}

- (UIColor *)selectedColor {
    if (!_selectedColor) {
        _selectedColor = @"333333".ylt_colorFromHexString;
    }
    return _selectedColor;
}

- (void)setSelectedColor:(UIColor *)selectedColor {
    _selectedColor = selectedColor;
    self.selectedImageView.backgroundColor = selectedColor;
}

- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        _mainCollectionView.backgroundColor = UIColor.clearColor;
        [_mainCollectionView registerCell:@[YLT_PalaceMenuCell.ylt_identify]];
        [self addSubview:_mainCollectionView];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _mainCollectionView;
}

- (UIImageView *)selectedImageView {
    if (!_selectedImageView) {
        _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.ylt_height-4, self.ylt_width/MIN(5, MAX(self.titles.count, 1)), self.ylt_height)];
        _selectedImageView.backgroundColor = self.selectedColor;
        [self.mainCollectionView addSubview:_selectedImageView];
        [_selectedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mainCollectionView);
            make.bottom.equalTo(self);
            make.width.equalTo(self).multipliedBy(1./((CGFloat)MIN(5, MAX(self.titles.count, 1))));
            make.height.mas_equalTo(2);
        }];
        @weakify(self);
        if (self.targetScrollView) {
            [RACObserve(self.targetScrollView, contentOffset) subscribeNext:^(NSValue *_Nullable x) {
                @strongify(self);
                CGPoint offset = [x CGPointValue];
                if (self.ylt_width != 0 && self.targetScrollView.ylt_width != 0) {
                    [self.selectedImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.left.mas_equalTo(self.selectedImageView.ylt_width*offset.x/self.ylt_width);
                    }];
                    self.selectedIndex = offset.x/self.targetScrollView.ylt_width;
                }
            }];
        } else {
            [RACObserve(self, selectedIndex) subscribeNext:^(NSNumber*  _Nullable x) {
                @strongify(self);
                [self.selectedImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(self.selectedImageView.ylt_width*x.integerValue);
                }];
            }];
        }
    }
    return _selectedImageView;
}

- (void)setTitles:(NSArray<NSString *> *)titles {
    _titles = titles;
    [self selectedImageView];
    [self.mainCollectionView reloadData];
}

@end




