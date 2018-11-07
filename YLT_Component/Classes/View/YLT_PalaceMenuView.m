//
//  YLT_PalaceMenuView.m
//  YLT_Component
//
//  Created by 项普华 on 2018/10/30.
//

#import "YLT_PalaceMenuView.h"

@interface YLT_PalaceMenuView ()
@property (nonatomic, strong) id<YLT_PalaceProtocol> menuData;
@property (nonatomic, strong) UIImageView *thumbImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation YLT_PalaceMenuView

+ (YLT_PalaceMenuView *)ylt_palaceMenuView:(id<YLT_PalaceProtocol>)palaceMenu {
    YLT_PalaceMenuView *menu = [[YLT_PalaceMenuView alloc] init];
    menu.menuData = palaceMenu;
    return menu;
}

- (void)setMenuData:(id<YLT_PalaceProtocol>)menuData {
    if (![menuData conformsToProtocol:@protocol(YLT_PalaceProtocol)]) {
        //没有实现指定的协议
        NSString *reason = [NSString stringWithFormat:@"%@ 没有实现协议", NSStringFromClass(menuData)];
        NSAssert(NO, reason);
        return;
    }
    _menuData = menuData;
    switch (_menuData.ylt_menuType) {
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
    if (_thumbImageView) {
        self.thumbImageView.ylt_image(_menuData.ylt_menuThumbImage);
        if ([_menuData respondsToSelector:@selector(ylt_thumbImageMaker)]) {
            [self.thumbImageView mas_remakeConstraints:_menuData.ylt_thumbImageMaker];
        }
    }
    if (_nameLabel) {//已经使用了标题
        if ([_menuData respondsToSelector:@selector(ylt_menuFont)]) {
            self.nameLabel.font = _menuData.ylt_menuFont;
        }
        if ([_menuData respondsToSelector:@selector(ylt_menuTextColor)]) {
            self.nameLabel.textColor = _menuData.ylt_menuTextColor;
        }
        if ([_menuData respondsToSelector:@selector(ylt_titleMaker)]) {
            [self.nameLabel mas_remakeConstraints:_menuData.ylt_titleMaker];
        }
        self.nameLabel.ylt_text(_menuData.ylt_menuTitle);
    }
}

- (UIImageView *)thumbImageView {
    if (!_thumbImageView) {
        _thumbImageView = UIImageView.ylt_create().ylt_convertToImageView().ylt_contentMode(UIViewContentModeScaleAspectFit);
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


@interface YLT_PalaceMenuCell ()
@property (nonatomic, strong) YLT_PalaceMenuView *mainView;
@end

@implementation YLT_PalaceMenuCell

- (void)setComponentData:(id)componentData {
    [super setComponentData:componentData];
    self.mainView.menuData = componentData;
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
