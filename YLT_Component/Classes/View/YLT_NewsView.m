//
//  YLT_NewsView.m
//  AFNetworking
//
//  Created by 项普华 on 2018/11/19.
//

#import "YLT_NewsView.h"
#import "YLT_ComponentModel.h"

@interface YLT_NewsView() {
}

@property (nonatomic, strong) UIImageView *thumbImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation YLT_NewsView

/**
 生成新闻视图
 
 @param data 新闻内容
 @return 新闻视图
 */
+ (YLT_NewsView *)ylt_newsView:(id<YLT_NewsProtocol>)data {
    YLT_NewsView *result = [[YLT_NewsView alloc] init];
    result.componentData = data;
    return result;
}

- (void)updateData:(YLT_ComponentModel<YLT_NewsProtocol> *)data {
    if ([data conformsToProtocol:@protocol(YLT_NewsProtocol)]) {
        if ([data respondsToSelector:@selector(ylt_newsType)]) {
            switch (data.ylt_newsType) {
                case NewsTypeBigImage: {
                    [self.thumbImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.edges.equalTo(self);
                    }];
                    [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(@16);
                        make.bottom.mas_equalTo(-8);
                    }];
                }
                    break;
                case NewsTypeRightImage: {
                    [self.thumbImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.right.equalTo(self);
                        make.top.mas_equalTo(8);
                        make.bottom.mas_equalTo(-8);
                        make.width.equalTo(self.thumbImageView.mas_height);
                    }];
                    [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.left.equalTo(self);
                        make.right.equalTo(self.thumbImageView.mas_left).offset(-8);
                    }];
                }
                    break;
            }
        }
        if ([data respondsToSelector:@selector(ylt_placeholderImage)] && self.thumbImageView.image == nil) {
            self.thumbImageView.ylt_image(data.ylt_placeholderImage);
        }
        if ([data respondsToSelector:@selector(ylt_componentFont)]) {
            self.nameLabel.font = data.ylt_componentFont;
        }
        if ([data respondsToSelector:@selector(ylt_componentTextColor)]) {
            self.nameLabel.textColor = data.ylt_componentTextColor;
        }
        
        if (_thumbImageView) {
            if ([data respondsToSelector:@selector(ylt_constraintMaker)]) {
                [self.thumbImageView mas_remakeConstraints:data.ylt_constraintMaker];
            }
        }
        if (_nameLabel) {//已经使用了标题
            if ([data respondsToSelector:@selector(ylt_constraintMaker)]) {
                [self.nameLabel mas_remakeConstraints:data.ylt_constraintMaker];
            }
        }
        if ([data respondsToSelector:@selector(ylt_componentImage)]) {
            self.thumbImageView.ylt_image(data.ylt_componentImage);
        }
        if ([data respondsToSelector:@selector(ylt_componentTitle)]) {
            self.nameLabel.ylt_text(data.ylt_componentTitle);
        }
    }
}

- (UIImageView *)thumbImageView {
    if (!_thumbImageView) {
        _thumbImageView = UIImageView.ylt_create().ylt_convertToImageView().ylt_contentMode(UIViewContentModeScaleAspectFill);
        [self insertSubview:_thumbImageView atIndex:0];
        _thumbImageView.clipsToBounds = YES;
    }
    return _thumbImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = UILabel.ylt_create().ylt_convertToLabel().ylt_font([UIFont systemFontOfSize:16]).ylt_textColor(UIColor.whiteColor);
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

@end



@interface YLT_NewsCell ()
@property (nonatomic, strong) YLT_NewsView *mainView;
@property (nonatomic, strong) UIImageView *lineView;
@end

@implementation YLT_NewsCell

- (void)setSectionData:(YLT_ComponentModel *)sectionData {
    if ([sectionData conformsToProtocol:@protocol(YLT_NewsProtocol)]) {
        [super setSectionData:sectionData];
        if (sectionData.ylt_single) {
            if ([sectionData.ylt_dataSource isKindOfClass:[NSArray class]]) {
                UIView *superView = [[UIView alloc] init];
                [self addSubview:superView];
                superView.layer.cornerRadius = 8;
                superView.clipsToBounds = YES;
                [superView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                }];
                __block YLT_NewsView *lastView = nil;
                [sectionData.ylt_dataSource enumerateObjectsUsingBlock:^(YLT_ComponentModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    YLT_NewsView *result = [[YLT_NewsView alloc] init];
                    result.sectionData = self.sectionData;
                    result.componentData = obj;
                    [superView addSubview:result];
                    [result mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.right.equalTo(self);
                        (idx==0)?make.top.equalTo(self):make.top.equalTo(lastView.mas_bottom);
                        make.height.mas_equalTo(self.ylt_width/obj.ylt_ratio);
                    }];
                    if (idx != 0 && idx != sectionData.ylt_dataSource.count-1) {
                        UIImageView.ylt_createLayout(result, ^(MASConstraintMaker *make) {
                            make.left.right.bottom.equalTo(result);
                            make.height.mas_equalTo(0.5);
                        }).ylt_backgroundColor(@"cccccc".ylt_colorFromHexString);
                    }
                    lastView = result;
                }];
            }
            return;
        }
        self.mainView.sectionData = sectionData;
    }
}

- (void)setComponentData:(id)componentData {
    [super setComponentData:componentData];
    if (self.sectionData.ylt_single) {
        return;
    }
    self.mainView.componentData = componentData;
    YLT_ComponentModel *obj = ((YLT_ComponentModel *)self.mainView.sectionData);
    if ([obj.ylt_dataSource isKindOfClass:[NSArray class]]) {
        if ([componentData isEqual:obj.ylt_dataSource.firstObject] || [componentData isEqual:obj.ylt_dataSource.lastObject]) {
            /** 新闻消息第一条或最后一条 */
            _lineView.hidden = YES;
        } else {
            self.lineView.hidden = NO;
        }
    }
}

- (UIImageView *)lineView {
    if (!_lineView) {
        _lineView = UIImageView.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(0.5);
        }).ylt_backgroundColor(@"cccccc".ylt_colorFromHexString);
    }
    return _lineView;
}

- (YLT_NewsView *)mainView {
    if (!_mainView) {
        _mainView = [[YLT_NewsView alloc] init];
        [self addSubview:_mainView];
        [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _mainView;
}

@end
