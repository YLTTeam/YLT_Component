//
//  YLT_BaseComponentCell.h
//  YLT_Component
//
//  Created by 项普华 on 2018/10/31.
//

#import <YLT_Kit/YLT_Kit.h>
#import "YLT_ComponentModel.h"

@interface YLT_BaseComponentView : YLT_BaseView

/**
 整块区域的数据 用来读取基本的配置信息
 */
@property (nonatomic, strong) YLT_ComponentModel *sectionData;

@property (nonatomic, strong) YLT_ComponentModel *componentData;

- (void)updateData:(YLT_ComponentModel *)data;

@end

@interface YLT_BaseComponentCell : UICollectionViewCell

/**
 整块区域的数据 用来读取基本的配置信息
 */
@property (nonatomic, strong) YLT_ComponentModel *sectionData;

@property (nonatomic, strong) YLT_ComponentModel *componentData;

- (void)updateData:(YLT_ComponentModel *)data;

@end
