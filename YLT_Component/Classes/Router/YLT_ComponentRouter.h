//
//  YLT_ComponentRouter.h
//  YLT_Component
//
//  Created by 项普华 on 2018/10/30.
//

#import <YLT_BaseLib/YLT_BaseLib.h>

@interface YLT_ComponentRouter : YLT_BaseRouter

/**
 路由到组件视图

 @param params 参数
 @return 回参
 */
+ (id)ylt_componentVCRouter:(id)params;

/**
 路由回调

 @param params 回调参数
 @return 回参
 */
+ (id)ylt_componentCompletion:(id)params;

@end
