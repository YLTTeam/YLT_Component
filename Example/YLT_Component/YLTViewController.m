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

@interface TestModel : YLT_BaseModel<YLT_PalaceProtocol>

@end

@implementation TestModel

- (MenuType)ylt_menuType {
    return 1;
}

- (NSString *)ylt_menuTitle {
    return @"这里是标题1";
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
    UIViewController *vc = [YLT_RouterManager ylt_routerToURL:@"ylt://YLT_ComponentRouter/ylt_componentVCRouter:?username=alex&password=123456" arg:model completion:^(NSError *error, id response) {
        NSLog(@"%@", response);
    }];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
