//
//  YLT_BaseComponentCell.h
//  YLT_Component
//
//  Created by 项普华 on 2018/10/31.
//

#import <UIKit/UIKit.h>

@interface YLT_BaseComponentCell : UICollectionViewCell

/**
 整块区域的数据 用来读取基本的配置信息
 */
@property (nonatomic, strong) id sectionData;

@property (nonatomic, strong) id componentData;

@end
