//
//  YLT_TopTabVC.m
//  AFNetworking
//
//  Created by 项普华 on 2018/11/22.
//

#import "YLT_TopTabVC.h"
#import "YLT_TopTabView.h"
#import "YLT_ComponentVC.h"

#define TOP_TAB_HEIGHT 48

@interface YLT_TopTabCell : YLT_BaseComponentCell

@property (nonatomic, strong) YLT_ComponentVC *targetVC;

@end

@implementation YLT_TopTabCell

- (YLT_ComponentVC *)targetVC {
    if (!_targetVC) {
        _targetVC = [[YLT_ComponentVC alloc] init];
        [self addSubview:_targetVC.view];
        [_targetVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [self.ylt_currentVC addChildViewController:_targetVC];
    }
    return _targetVC;
}

@end

@interface YLT_TopTabVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) YLT_TopTabView *topTab;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) NSDictionary *lastPageData;
@end

@implementation YLT_TopTabVC

@synthesize list = _list;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)ylt_bindData {
    self.lastPageData = self.ylt_params;
    if ([self.lastPageData.allKeys containsObject:@"ylt_arg"]) {
        id obj = self.lastPageData[@"ylt_arg"];
        if ([obj isKindOfClass:[NSArray class]]) {
            self.list = obj;
        } else {
            self.list = @[obj];
        }
    }
}

- (void)ylt_addSubViews {
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_TopTabCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YLT_TopTabCell.ylt_identify forIndexPath:indexPath];
    cell.targetVC.list = self.datas[indexPath.row];
    cell.targetVC.mainCollectionView.contentOffset = CGPointZero;
    return cell;
}

#pragma mark - setter getter

- (YLT_TopTabView *)topTab {
    if (!_topTab) {
        _topTab = [YLT_TopTabView ylt_topTabFromTitles:self.titles targetScrollView:self.mainCollectionView];
        [self.view addSubview:_topTab];
        [_topTab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            make.height.mas_equalTo(TOP_TAB_HEIGHT);
        }];
    }
    return _topTab;
}

- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.minimumLineSpacing = 0;
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowlayout.itemSize = CGSizeMake(YLT_SCREEN_WIDTH, YLT_SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT-TOP_TAB_HEIGHT);
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        _mainCollectionView.backgroundColor = UIColor.clearColor;
        _mainCollectionView.pagingEnabled = YES;
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        _mainCollectionView.directionalLockEnabled = YES;
        [_mainCollectionView registerCell:@[YLT_TopTabCell.ylt_identify]];
        [self.view addSubview:_mainCollectionView];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.width.equalTo(self.view);
            make.top.mas_equalTo(TOP_TAB_HEIGHT);
            make.height.equalTo(self.view).offset(-TOP_TAB_HEIGHT);
        }];
    }
    return _mainCollectionView;
}

- (void)setList:(NSMutableArray<YLT_ComponentModel<YLT_TopTabProtocol> *> *)list {
    if (!_list) {
        _list = [[NSMutableArray alloc] init];
    }
    [_list removeAllObjects];
    [list enumerateObjectsUsingBlock:^(YLT_ComponentModel<YLT_TopTabProtocol> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj conformsToProtocol:@protocol(YLT_TopTabProtocol)]) {
            [self.titles addObject:obj.ylt_tabTitle];
            [self.datas addObject:obj.ylt_dataSource];
        }
    }];
    self.topTab.titles = self.titles;
}

- (NSMutableArray<YLT_ComponentModel<YLT_TopTabProtocol> *> *)list {
    if (!_list) {
        _list = [[NSMutableArray alloc] init];
    }
    return _list;
}

- (NSMutableArray *)titles {
    if (!_titles) {
        _titles = [[NSMutableArray alloc] init];
    }
    return _titles;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [[NSMutableArray alloc] init];
    }
    return _datas;
}

@end
