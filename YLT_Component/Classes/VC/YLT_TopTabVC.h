//
//  YLT_TopTabVC.h
//  AFNetworking
//
//  Created by 项普华 on 2018/11/22.
//

#import <YLT_Kit/YLT_Kit.h>
#import "YLT_ComponentModel.h"
#import "YLT_ComponentProtocol.h"

@interface YLT_TopTabVC : YLT_BaseVC

@property (nonatomic, strong) NSMutableArray<YLT_TopTabProtocol> *list;

@property (nonatomic, strong) UICollectionView *mainCollectionView;

@end
