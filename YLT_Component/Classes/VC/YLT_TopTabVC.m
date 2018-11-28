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

#pragma mark - setter getter

- (YLT_TopTabView *)topTab {
    if (!_topTab) {
        _topTab = [YLT_TopTabView ylt_topTabFromTitles:self.titles targetScrollView:self.mainScrollView];
        [self.view addSubview:_topTab];
        [_topTab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            make.height.mas_equalTo(TOP_TAB_HEIGHT);
        }];
    }
    return _topTab;
}

- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.delegate = self;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.directionalLockEnabled = YES;
        [self.view addSubview:_mainScrollView];
        [_mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.width.equalTo(self.view);
            make.top.mas_equalTo(TOP_TAB_HEIGHT);
            make.height.equalTo(self.view).offset(-TOP_TAB_HEIGHT);
        }];
    }
    return _mainScrollView;
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
    __block YLT_ComponentVC *lastTargetVC = nil;
    [self.datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        YLT_ComponentVC *currentTargetVC = [[YLT_ComponentVC alloc] init];
        [self addChildViewController:currentTargetVC];
        [currentTargetVC didMoveToParentViewController:self];
        [self.mainScrollView addSubview:currentTargetVC.view];
        currentTargetVC.list = obj;
        if (idx == 0) {
            [currentTargetVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.bottom.equalTo(self.mainScrollView);
                make.height.equalTo(self.view).offset(-TOP_TAB_HEIGHT);
                make.width.equalTo(self.view);
            }];
        } else if (idx == self.datas.count-1) {
            [currentTargetVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastTargetVC.view.mas_right);
                make.centerY.height.width.equalTo(lastTargetVC.view);
                make.right.equalTo(self.mainScrollView);
            }];
        } else {
            [currentTargetVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastTargetVC.view.mas_right);
                make.centerY.height.width.equalTo(lastTargetVC.view);
            }];
        }
        lastTargetVC = currentTargetVC;
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
