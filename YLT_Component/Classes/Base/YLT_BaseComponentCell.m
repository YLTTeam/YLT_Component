//
//  YLT_BaseComponentCell.m
//  YLT_Component
//
//  Created by 项普华 on 2018/10/31.
//

#import "YLT_BaseComponentCell.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@implementation YLT_BaseComponentView

- (void)setSectionData:(YLT_ComponentModel *)sectionData {
    _sectionData = sectionData;
    if (sectionData.ylt_backgroundColor.ylt_isValid) {
        self.backgroundColor = sectionData.ylt_bgColor;
    }
    if (sectionData.ylt_router.ylt_isValid) {
        self.ylt_clickBlock(^(id sender) {
            [YLT_RouterManager ylt_routerToURL:sectionData.ylt_router isClassMethod:YES arg:nil completion:^(NSError *error, id response) {
                YLT_Log(@"%@", response);
            }];
        });
    }
    
    [self updateData:sectionData];
}

- (void)setComponentData:(YLT_ComponentModel *)componentData {
    _componentData = componentData;
    if (componentData.ylt_backgroundColor.ylt_isValid) {
        self.backgroundColor = componentData.ylt_bgColor;
    }
    if (componentData.ylt_router.ylt_isValid) {
        self.ylt_clickBlock(^(id sender) {
            [YLT_RouterManager ylt_routerToURL:componentData.ylt_router isClassMethod:YES arg:nil completion:^(NSError *error, id response) {
                YLT_Log(@"%@", response);
            }];
        });
    }
    [self updateData:componentData];
}

- (void)updateData:(YLT_ComponentModel *)data {
}

@end

@implementation YLT_BaseComponentCell

- (void)setSectionData:(YLT_ComponentModel *)sectionData {
    _sectionData = sectionData;
    self.backgroundColor = sectionData.ylt_bgColor;
    [self updateData:sectionData];
}

- (void)setComponentData:(YLT_ComponentModel *)componentData {
    _componentData = componentData;
    self.backgroundColor = componentData.ylt_bgColor;
    [self updateData:componentData];
}


- (void)updateData:(YLT_ComponentModel *)data {
}

@end
