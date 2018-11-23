//
//  YLT_TopTabView.h
//  AFNetworking
//
//  Created by 项普华 on 2018/11/22.
//

#import <YLT_Kit/YLT_Kit.h>

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
 记录一下主滚动视图
 */
@property (nonatomic, weak) UIScrollView *targetScrollView;

/**
 选中索引
 */
@property (nonatomic, assign) NSInteger selectedIndex;

/**
 生成顶部Tab

 @param titles 标题列表
 @param targetScrollView 下方的
 @return 顶部Tab
 */
+ (YLT_TopTabView *)ylt_topTabFromTitls:(NSArray<NSString *> *)titles
                       targetScrollView:(UIScrollView *)targetScrollView;

@end
