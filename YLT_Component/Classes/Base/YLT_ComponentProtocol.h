//
//  YLT_ComponentProtocol.h
//  Pods
//
//  Created by 项普华 on 2018/10/30.
//

#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>

typedef NS_ENUM(NSInteger, MenuType) {
    MenuTypeOnlyImage = 0,
    MenuTypeOnlyTitle = 1,
    MenuTypeImageAtLeft = 2,
    MenuTypeImageAtRight = 3,
    MenuTypeImageAtTop = 4,
    MenuTypeImageAtBottom = 5
};

@protocol YLT_PalaceProtocol <NSObject>

@optional
/**
 九宫格菜单类型 默认纯图片
 */
- (MenuType)ylt_menuType;
/**
 占位图
 */
- (NSString *)ylt_placeholderImage;
/**
 九宫格菜单的图片
 */
- (NSString *)ylt_menuThumbImage;
/**
 九宫格菜单的标题
 */
- (NSString *)ylt_menuTitle;
/**
 文字的字体字号
 */
- (UIFont *)ylt_menuFont;
/**
 文字的字体颜色 默认16号字 "666666" 颜色
 */
- (UIColor *)ylt_menuTextColor;

/**
 图片的约束
 */
- (void(^)(MASConstraintMaker *make))ylt_thumbImageMaker;

/**
 标题的约束
 */
- (void(^)(MASConstraintMaker *make))ylt_titleMaker;

@end
