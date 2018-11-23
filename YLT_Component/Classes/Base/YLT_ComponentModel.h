//
//  YLT_ComponnentModel.h
//  AFNetworking
//
//  Created by 项普华 on 2018/11/20.
//

#import <YLT_BaseLib/YLT_BaseLib.h>

@interface YLT_ComponentModel : YLT_BaseModel

/** 每行几个元素 默认1个 */
@property (nonatomic, assign) NSInteger ylt_countPreRow;
/** 总共多少航数据 默认1行 */
@property (nonatomic, assign) NSInteger ylt_rows;
/** 上下左右边距 默认 16 */
@property (nonatomic, assign) CGFloat ylt_topMargin;
@property (nonatomic, assign) CGFloat ylt_bottomMargin;
@property (nonatomic, assign) CGFloat ylt_leftMargin;
@property (nonatomic, assign) CGFloat ylt_rightMargin;
/** 间距 默认 8 */
@property (nonatomic, assign) CGFloat ylt_spacing;
/** 宽高比 默认 16:9 */
@property (nonatomic, assign) CGFloat ylt_ratio;
/** cell 对应的类名 */
@property (nonatomic, strong) NSString *ylt_cellClassName;
/** 不同model表示的意义不同 */
@property (nonatomic, assign) NSInteger ylt_type;
/** 背景色 */
@property (nonatomic, strong) NSString *ylt_backgroundColor;

/** 该模块需要的数据源 */
@property (nonatomic, strong) NSArray<YLT_ComponentModel *> *ylt_dataSource;
/** 进入该模块的路由 */
@property (nonatomic, strong) NSString *ylt_router;

/** 宽度 */
@property (nonatomic, assign) CGFloat ylt_width;
/** 高度 */
@property (nonatomic, assign) CGFloat ylt_height;
/** 是否是单条显示 */
@property (nonatomic, assign) BOOL ylt_single;

@property (nonatomic, strong) UIColor *ylt_bgColor;
/** 小红点显示 */
@property (nonatomic, strong) NSString *ylt_badge;

@end
