//
//  YLT_PalaceMenuView.h
//  YLT_Component
//
//  Created by 项普华 on 2018/10/30.
//

#import <YLT_Kit/YLT_Kit.h>
#import "YLT_BaseComponentCell.h"
#import "YLT_ComponentProtocol.h"

///九宫格菜单视图
@interface YLT_PalaceMenuView : YLT_BaseComponentView

/**
 九宫格菜单 item 生成

 @param item 菜单数据
 @param sectionData 区域数据
 @return 菜单 item
 */
+ (YLT_PalaceMenuView *)ylt_palaceMenuView:(id<YLT_PalaceProtocol>)item;

@end

///九宫格菜单的CELL
@interface YLT_PalaceMenuCell : YLT_BaseComponentCell

@end

