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
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) CGFloat ratio;
@end

@implementation Test2Model

- (NewsType)ylt_newsType {
    return self.type;
}

- (CGFloat)ylt_ratio {
    return self.ratio;
}

- (MenuType)ylt_menuType {
    return 4;
}

- (NSString *)ylt_componentTitle {
    return self.username;
}

- (NSString *)ylt_componentImage {
    return @"logo";//@"http://a.hiphotos.baidu.com/image/h%3D300/sign=b18b23079522720e64cee4fa4bca0a3a/4a36acaf2edda3ccc4a53e450ce93901213f9216.jpg";
}

@end

@interface TestModel : YLT_BaseModel<YLT_PalaceProtocol, YLT_NewsProtocol>

@end

@implementation TestModel

- (MenuType)ylt_menuType {
    return 1;
}

- (NSString *)ylt_componentTitle {
    return @"这里是标题1";
}

- (UIFont *)ylt_componentFont {
    return [UIFont systemFontOfSize:18];
}

- (UIColor *)ylt_componentTextColor {
    return [UIColor redColor];
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
    NSArray *list = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Page" ofType:@"geojson"]] options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *data = [[NSMutableArray alloc] init];
    for (int i = 0; i < list.count; i++) {
        TestModel *model = [TestModel ylt_objectWithKeyValues:list[i]];
        [data addObject:model];
    }
    [YLT_RouterManager ylt_routerToURL:@"ylt://YLT_ComponentRouter/ylt_componentVCRouter:?username=alex&password=123456" isClassMethod:YES arg:data completion:^(NSError *error, id response) {
        NSLog(@"%@", response);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
