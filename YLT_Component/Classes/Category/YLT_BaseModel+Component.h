//
//  YLT_BaseModel+Component.h
//  YLT_Component
//
//  Created by 项普华 on 2018/10/31.
//

#import <YLT_BaseLib/YLT_BaseLib.h>
#import "YLT_ComponentProtocol.h"

@interface YLT_BaseModel (Component)
/** 该模块需要的数据源 */
@property (nonatomic, strong) id ylt_dataSource;
/** 进入该模块的路由 */
@property (nonatomic, strong) NSString *ylt_router;
/** 每行几个元素 默认1个 */
@property (nonatomic, assign) NSInteger ylt_countPreRow;
/** 上下左右边距 默认 16 */
@property (nonatomic, assign) CGFloat ylt_topMargin;
@property (nonatomic, assign) CGFloat ylt_bottomMargin;
@property (nonatomic, assign) CGFloat ylt_leftMargin;
@property (nonatomic, assign) CGFloat ylt_rightMargin;
/** 间距 默认 8 */
@property (nonatomic, assign) CGFloat ylt_spacing;
/** 宽度 */
@property (nonatomic, assign) CGFloat ylt_width;
/** 高度 */
@property (nonatomic, assign) CGFloat ylt_height;
/** 宽高比 默认 16:9 */
@property (nonatomic, assign) CGFloat ylt_ratio;
/** cell 对应的类名 */
@property (nonatomic, strong) NSString *ylt_cellClassName;
@end
