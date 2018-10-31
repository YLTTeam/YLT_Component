//
//  YLT_PalaceMenuView.h
//  YLT_Component
//
//  Created by 项普华 on 2018/10/30.
//

#import <YLT_Kit/YLT_Kit.h>
#import "YLT_BaseComponentCell.h"
#import "YLT_ComponentProtocol.h"

@interface YLT_PalaceMenuView : YLT_BaseView
+ (YLT_PalaceMenuView *)ylt_palaceMenuView:(id<YLT_PalaceProtocol>)palaceMenu;
@end

@interface YLT_PalaceMenuCell : YLT_BaseComponentCell
@end

