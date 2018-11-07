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
+ (id)ylt_componentVCRouter:(id)params {
    YLT_ComponentVC *vc = [YLT_ComponentVC ylt_createVCWithParam:params];
    if (self.ylt_currentVC.navigationController) {
        [self.ylt_currentVC.navigationController pushViewController:vc animated:YES];
    } else {
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [self.ylt_currentVC presentViewController:navi animated:YES completion:nil];
    }
    return vc;
}

/**
 路由回调
 
 @param params 回调参数
 @return 回参
 */
+ (id)ylt_componentCompletion:(id)params {
    YLT_BaseVC *vc = nil;
    if ([((NSDictionary *)params).allKeys containsObject:@"vc"]) {
        vc = (YLT_ComponentVC *)[((NSDictionary *)params) objectForKey:@"vc"];
    } else {
        vc = self.ylt_currentVC;
    }
    if ([vc respondsToSelector:@selector(ylt_completion)]) {
        vc.ylt_completion(nil, params);
    }
    [vc.navigationController popViewControllerAnimated:YES];
    return vc;
}

@end
