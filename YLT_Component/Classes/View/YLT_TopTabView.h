//
//  YLT_TopTabView.h
//  AFNetworking
//
//  Created by 项普华 on 2018/11/22.
//

#import <YLT_Kit/YLT_Kit.h>
#import "YLT_BaseComponentCell.h"
#import "YLT_ComponentProtocol.h"

@interface YLT_TopTabView : YLT_BaseView

/**
 普通颜色
 */
@property (nonatomic, strong) UIColor *normalColor;
/**
 选中颜色
 */
@property (nonatomic, strong) UIColor *selectedColor;
/**
 下方的标签栏 默认为 selectedColor
 */
@property (nonatomic, strong) UIImageView *selectedImageView;

/**
 记录一下主滚动视图
 */
@property (nonatomic, weak) UIScrollView *targetScrollView;

/**
 选中索引
 */
@property (nonatomic, assign) NSInteger selectedIndex;

/**
 文字的字体
 */
@property (nonatomic, strong) UIFont *font;
/**
 标题列表
 */
@property (nonatomic, strong) NSArray<NSString *> *titles;

/**
 生成顶部Tab

 @param titles 标题列表
 @param targetScrollView 下方的
 @return 顶部Tab
 */
+ (YLT_TopTabView *)ylt_topTabFromTitles:(NSArray<NSString *> *)titles
                        targetScrollView:(UIScrollView *)targetScrollView;

@end


