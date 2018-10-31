//
//  YLT_ComponentRouter.m
//  YLT_Component
//
//  Created by 项普华 on 2018/10/30.
//

#import "YLT_ComponentRouter.h"
#import "YLT_ComponentVC.h"
#import <YLT_Kit/YLT_Kit.h>

@implementation YLT_ComponentRouter

/**
 路由到组件视图
 
 @param params 参数
 @return 回参
 */
- (id)ylt_componentVCRouter:(id)params {
    YLT_ComponentVC *vc = [YLT_ComponentVC ylt_createVCWithParam:params];
    return vc;
}

@end
