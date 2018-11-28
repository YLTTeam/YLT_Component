//
//  YLT_ComponentVC.m
//  YLT_Component
//
//  Created by 项普华 on 2018/10/30.
//

#import "YLT_ComponentVC.h"

@interface YLT_ComponentVC ()
@property (nonatomic, strong) NSDictionary *lastPageData;
@end

@implementation YLT_ComponentVC

@synthesize list = _list;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)ylt_bindData {
    self.lastPageData = self.ylt_params;
    YLT_Log(@"%@", self.lastPageData);
    /**
     1、从网络上拿到数据以后赋值给 self.list
     2、将 self.list 中涉及到的Cell 全部注册一遍
     3、刷新列表
     */
    
    if ([self.lastPageData.allKeys containsObject:@"ylt_arg"]) {
        id obj = self.lastPageData[@"ylt_arg"];
        if ([obj isKindOfClass:[NSArray class]]) {
            self.list = obj;
        } else {
            self.list = @[obj];
        }
    }
}

#pragma mark - setter getter

- (void)setList:(NSMutableArray<YLT_ComponentModel *> *)list {
    if (!_list) {
        _list = [[NSMutableArray alloc] init];
    }
    [_list removeAllObjects];
    [_list addObjectsFromArray:list];
    [_list enumerateObjectsUsingBlock:^(YLT_ComponentModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(ylt_cellClassName)]) {
            [self.mainCollectionView registerCell:@[obj.ylt_cellClassName]];
        } else {
            NSAssert(NO, @"组件类Model异常");
        }
    }];
    [self.mainCollectionView reloadData];
}

- (NSMutableArray<YLT_ComponentModel *> *)list {
    if (!_list) {
        _list = [[NSMutableArray alloc] init];
    }
    return _list;
}

- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _mainCollectionView.backgroundColor = UIColor.clearColor;
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        [self.view addSubview:_mainCollectionView];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _mainCollectionView;
}

@end
