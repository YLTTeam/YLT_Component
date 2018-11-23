//
//  YLT_ComponnentModel.m
//  AFNetworking
//
//  Created by 项普华 on 2018/11/20.
//

#import "YLT_ComponentModel.h"

@implementation YLT_ComponentModel

- (NSInteger)ylt_countPreRow {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_countPreRow"]) {
        _ylt_countPreRow = 1;
    }
    return _ylt_countPreRow;
}

- (NSInteger)ylt_rows {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_rows"]) {
        _ylt_rows = 1;
    }
    return _ylt_rows;
}

- (CGFloat)ylt_topMargin {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_topMargin"]) {
        _ylt_topMargin = 16.;
    }
    return _ylt_topMargin;
}

- (CGFloat)ylt_bottomMargin {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_bottomMargin"]) {
        _ylt_bottomMargin = 16.;
    }
    return _ylt_bottomMargin;
}

- (CGFloat)ylt_leftMargin {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_leftMargin"]) {
        _ylt_leftMargin = 16.;
    }
    return _ylt_leftMargin;
}

- (CGFloat)ylt_rightMargin {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_rightMargin"]) {
        _ylt_rightMargin = 16.;
    }
    return _ylt_rightMargin;
}

- (CGFloat)ylt_spacing {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_spacing"]) {
        _ylt_spacing = 8.;
    }
    return _ylt_spacing;
}

- (CGFloat)ylt_ratio {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_ratio"]) {
        _ylt_ratio = 16./9.;
    }
    return _ylt_ratio;
}

- (NSString *)ylt_cellClassName {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_cellClassName"]) {
        _ylt_cellClassName = @"YLT_BaseComponentCell";
        YLT_LogError(@"类名异常");
    }
    return _ylt_cellClassName;
}

- (NSInteger)ylt_type {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_type"]) {
        _ylt_type = 0;
    }
    return _ylt_type;
}

- (NSString *)ylt_backgroundColor {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_backgroundColor"]) {
        _ylt_backgroundColor = @"";
    }
    return _ylt_backgroundColor;
}

- (NSArray<YLT_ComponentModel *> *)ylt_dataSource {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_dataSource"]) {
        _ylt_dataSource = @[];
    }
    return _ylt_dataSource;
}

- (NSString *)ylt_router {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_router"]) {
        _ylt_router = @"";
    }
    return _ylt_router;
}

- (BOOL)ylt_single {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_single"]) {
        _ylt_single = NO;
    }
    return _ylt_single;
}

- (UIColor *)ylt_bgColor {
    return self.ylt_backgroundColor.ylt_colorFromHexString;
}

- (NSString *)ylt_badge {
    if (self.ylt_sourceData && ![((NSDictionary *)self.ylt_sourceData).allKeys containsObject:@"ylt_badge"]) {
        _ylt_badge = nil;
    }
    return _ylt_badge;
}

@end
