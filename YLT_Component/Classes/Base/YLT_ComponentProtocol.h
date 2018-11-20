//
//  YLT_ComponentProtocol.h
//  Pods
//
//  Created by 项普华 on 2018/10/30.
//

#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>

@protocol YLT_ComponentActionProtocol <NSObject>

/**
 组件的约束
 */
- (void(^)(MASConstraintMaker *make))ylt_constraintMaker;
/**
 组件事件回调
 */
- (void(^)(id sender))ylt_componentBlock;

@end

@protocol YLT_ImageViewProtocol <NSObject, YLT_ComponentActionProtocol>

/**
 占位图
 */
- (NSString *)ylt_placeholderImage;
/**
 九宫格菜单的图片
 */
- (NSString *)ylt_componentImage;

@end

@protocol YLT_LabelProtocol <NSObject>
/**
 九宫格菜单的标题
 */
- (NSString *)ylt_componentTitle;
/**
 文字的字体字号
 */
- (UIFont *)ylt_componentFont;
/**
 文字的字体颜色 默认16号字 "666666" 颜色
 */
- (UIColor *)ylt_componentTextColor;

@end


///九宫格菜单的 item 布局
typedef NS_ENUM(NSInteger, MenuType) {
    /** 仅有图片 */
    MenuTypeOnlyImage = 1,
    /** 仅有标题 */
    MenuTypeOnlyTitle = 2,
    /** 左图右标题 */
    MenuTypeImageAtLeft = 3,
    /** 右图左标题 */
    MenuTypeImageAtRight = 4,
    /** 上图下标题 */
    MenuTypeImageAtTop = 5,
    /** 下图上标题 */
    MenuTypeImageAtBottom = 6
};

///九宫格菜单的协议
@protocol YLT_PalaceProtocol <NSObject, YLT_ComponentActionProtocol, YLT_ImageViewProtocol, YLT_LabelProtocol>

@optional
/**
 九宫格菜单类型 默认纯图片
 */
- (MenuType)ylt_menuType;

@end


///新闻类协议
typedef NS_ENUM(NSInteger, NewsType) {
    /** 上面大图的新闻 */
    NewsTypeBigImage = 1,
    /** 下面标题加右边小图片的新闻 */
    NewsTypeRightImage = 2,
};

@protocol YLT_NewsProtocol<NSObject, YLT_ComponentActionProtocol, YLT_ImageViewProtocol, YLT_LabelProtocol>

@optional
/**
 新闻类型
 */
- (NewsType)ylt_newsType;

@end


