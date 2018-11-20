//
//  YLT_NewsView.h
//  AFNetworking
//
//  Created by 项普华 on 2018/11/19.
//

#import <YLT_Kit/YLT_Kit.h>
#import "YLT_BaseComponentCell.h"
#import "YLT_ComponentProtocol.h"

///新闻类视图
@interface YLT_NewsView : YLT_BaseComponentView

/**
 生成新闻视图

 @param data 新闻内容
 @return 新闻视图
 */
+ (YLT_NewsView *)ylt_newsView:(id<YLT_NewsProtocol>)data;

@end

///新闻类CELL
@interface YLT_NewsCell : YLT_BaseComponentCell

@end

