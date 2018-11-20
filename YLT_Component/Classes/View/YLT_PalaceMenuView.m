//
//  YLT_PalaceMenuView.m
//  YLT_Component
//
//  Created by 项普华 on 2018/10/30.
//

#import "YLT_PalaceMenuView.h"
#import <UICollectionViewLeftAlignedLayout/UICollectionViewLeftAlignedLayout.h>

@interface YLT_PalaceMenuView ()
@property (nonatomic, strong) UIImageView *thumbImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation YLT_PalaceMenuView

+ (YLT_PalaceMenuView *)ylt_palaceMenuView:(id<YLT_PalaceProtocol>)palaceMenu {
    YLT_PalaceMenuView *menu = [[YLT_PalaceMenuView alloc] init];
    menu.componentData = palaceMenu;
    return menu;
}

- (void)updateData:(YLT_ComponentModel<YLT_PalaceProtocol> *)data {
    if (![data conformsToProtocol:@protocol(YLT_PalaceProtocol)]) {
        //没有实现指定的协议
        NSString *reason = [NSString stringWithFormat:@"%@ 没有实现协议", NSStringFromClass(data)];
        NSAssert(NO, reason);
        return;
    }
    if ([data respondsToSelector:@selector(ylt_menuType)]) {
        switch (data.ylt_menuType) {
            case MenuTypeOnlyImage: {
                [self.thumbImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                }];
            }
                break;
            case MenuTypeOnlyTitle: {
                [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                }];
            }
                break;
            case MenuTypeImageAtTop: {
                [self.thumbImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.top.equalTo(self);
                    make.height.equalTo(self).multipliedBy(0.8);
                }];
                [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(self);
                    make.height.equalTo(self).multipliedBy(0.2);
                }];
            }
                break;
            case MenuTypeImageAtLeft: {
                [self.thumbImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.top.bottom.equalTo(self);
                    make.width.equalTo(self).multipliedBy(0.5);
                }];
                [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.right.top.bottom.equalTo(self);
                    make.width.equalTo(self).multipliedBy(0.5);
                }];
            }
                break;
            case MenuTypeImageAtRight: {
                [self.thumbImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.right.top.bottom.equalTo(self);
                    make.width.equalTo(self).multipliedBy(0.5);
                }];
                [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.top.bottom.equalTo(self);
                    make.width.equalTo(self).multipliedBy(0.5);
                }];
            }
                break;
            case MenuTypeImageAtBottom: {
                [self.thumbImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(self);
                    make.height.equalTo(self).multipliedBy(0.8);
                }];
                [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.top.equalTo(self);
                    make.height.equalTo(self).multipliedBy(0.2);
                }];
            }
                break;
        }
    }
    
    if (_thumbImageView) {
        if ([data respondsToSelector:@selector(ylt_placeholderImage)] && self.thumbImageView.image == nil) {
            self.thumbImageView.ylt_image(data.ylt_placeholderImage);
        }
        if ([data respondsToSelector:@selector(ylt_constraintMaker)]) {
            [self.thumbImageView mas_remakeConstraints:data.ylt_constraintMaker];
        }
        if ([data respondsToSelector:@selector(ylt_componentImage)]) {
            self.thumbImageView.ylt_image(data.ylt_componentImage);
        }
    }
    if (_nameLabel) {//已经使用了标题
        if ([data respondsToSelector:@selector(ylt_componentFont)]) {
            self.nameLabel.font = data.ylt_componentFont;
        }
        if ([data respondsToSelector:@selector(ylt_componentTextColor)]) {
            self.nameLabel.textColor = data.ylt_componentTextColor;
        }
        if ([data respondsToSelector:@selector(ylt_constraintMaker)]) {
            [self.nameLabel mas_remakeConstraints:data.ylt_constraintMaker];
        }
        if ([data respondsToSelector:@selector(ylt_componentTitle)]) {
            self.nameLabel.ylt_text(data.ylt_componentTitle);
        }
    }
}

- (UIImageView *)thumbImageView {
    if (!_thumbImageView) {
        _thumbImageView = UIImageView.ylt_create().ylt_convertToImageView().ylt_contentMode(UIViewContentModeScaleAspectFill);
        _thumbImageView.clipsToBounds = YES;
        [self addSubview:_thumbImageView];
    }
    return _thumbImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = UILabel.ylt_create().ylt_convertToLabel().ylt_fontSize(16).ylt_textColor(@"666666".ylt_colorFromHexString).ylt_textAlignment(NSTextAlignmentCenter);
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

@end


@interface YLT_PalaceMenuCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *horCollectionView;
@property (nonatomic, strong) YLT_PalaceMenuView *mainView;
@end

@implementation YLT_PalaceMenuCell

- (void)setSectionData:(YLT_ComponentModel *)sectionData {
    if ([sectionData conformsToProtocol:@protocol(YLT_PalaceProtocol)]) {
        [super setSectionData:sectionData];
        if (sectionData.ylt_single) {
            [self horCollectionView];
            return;
        }
        self.mainView.sectionData = sectionData;
    }
}

- (void)setComponentData:(YLT_ComponentModel *)componentData {
    [super setComponentData:componentData];
    if (self.sectionData && self.sectionData.ylt_single) {
        return;
    }
    self.mainView.componentData = componentData;
}

- (UICollectionView *)horCollectionView {
    if (!_horCollectionView) {
        UICollectionViewLeftAlignedLayout *flowLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
        CGFloat width = (YLT_SCREEN_WIDTH-self.sectionData.ylt_leftMargin-self.sectionData.ylt_rightMargin);
        CGFloat height = width/self.sectionData.ylt_ratio;
        width = (width-self.sectionData.ylt_spacing*(self.sectionData.ylt_countPreRow-1))/self.sectionData.ylt_countPreRow;
        height = (height-self.sectionData.ylt_spacing*(self.sectionData.ylt_rows-1))/self.sectionData.ylt_rows;
        flowLayout.itemSize = CGSizeMake(width, height);
        flowLayout.minimumLineSpacing = self.sectionData.ylt_spacing;
        flowLayout.minimumInteritemSpacing = self.sectionData.ylt_spacing;
        flowLayout.sectionInset = UIEdgeInsetsZero;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _horCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _horCollectionView.backgroundColor = UIColor.clearColor;
        _horCollectionView.showsHorizontalScrollIndicator = NO;
        [_horCollectionView registerCell:@[@"YLT_PalaceMenuCell"]];
        _horCollectionView.delegate = self;
        _horCollectionView.dataSource = self;
        [self addSubview:_horCollectionView];
        [_horCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _horCollectionView;
}

- (YLT_PalaceMenuView *)mainView {
    if (!_mainView) {
        _mainView = [[YLT_PalaceMenuView alloc] init];
        [self addSubview:_mainView];
        [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _mainView;
}

@end

@implementation YLT_PalaceMenuCell(Delegate)

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sectionData.ylt_dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_PalaceMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YLT_PalaceMenuCell.ylt_identify forIndexPath:indexPath];
    YLT_ComponentModel<YLT_PalaceProtocol> *model = [self.sectionData.ylt_dataSource objectAtIndex:indexPath.row];
    if (model.ylt_menuType == 0) {
        YLT_ComponentModel<YLT_PalaceProtocol> *obj = self.sectionData;
        model.ylt_menuType = obj.ylt_menuType;
    }
    cell.componentData = model;
    return cell;
}

@end






