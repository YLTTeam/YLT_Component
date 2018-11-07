//
//  YLTViewController.m
//  YLT_Component
//
//  Created by xphaijj0305@126.com on 10/30/2018.
//  Copyright (c) 2018 xphaijj0305@126.com. All rights reserved.
//

#import "YLTViewController.h"
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <YLT_Kit/YLT_Kit.h>
#import "YLT_Component.h"

@interface Test2Model : YLT_BaseModel<YLT_PalaceProtocol>

@end

@implementation Test2Model

- (MenuType)ylt_menuType {
    return 4;
}

- (NSString *)ylt_menuTitle {
    return @"这里是标题2";
}

- (NSString *)ylt_menuThumbImage {
    return @"logo";//@"http://a.hiphotos.baidu.com/image/h%3D300/sign=b18b23079522720e64cee4fa4bca0a3a/4a36acaf2edda3ccc4a53e450ce93901213f9216.jpg";
}

@end

@interface TestModel : YLT_BaseModel<YLT_PalaceProtocol>

@end

@implementation TestModel

- (MenuType)ylt_menuType {
    return 1;
}

- (NSString *)ylt_menuTitle {
    return @"这里是标题1";
}

+ (NSDictionary *)ylt_keyMapper {
    return @{};
}

+ (NSDictionary *)ylt_classInArray {
    return @{@"ylt_dataSource":@"Test2Model"};
}

@end


@interface YLTViewController ()
@end

@implementation YLTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Page" ofType:@"geojson"]] options:NSJSONReadingAllowFragments error:nil];
    TestModel *model = [TestModel ylt_objectWithKeyValues:dic];
    [YLT_RouterManager ylt_routerToURL:@"ylt://YLT_ComponentRouter/ylt_componentVCRouter:?username=alex&password=123456" isClassMethod:YES arg:model completion:^(NSError *error, id response) {
        NSLog(@"%@", response);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
