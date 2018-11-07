//
//  YLT_BaseModel+Component.m
//  YLT_Component
//
//  Created by 项普华 on 2018/10/31.
//

#import "YLT_BaseModel+Component.h"

@implementation YLT_BaseModel (Component)

- (void)setYlt_dataSource:(id)ylt_dataSource {
    objc_setAssociatedObject(self, @selector(ylt_dataSource), ylt_dataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)ylt_dataSource {
    id obj = objc_getAssociatedObject(self, @selector(ylt_dataSource));
    if (obj == nil && [((NSDictionary *) self.ylt_sourceData).allKeys containsObject:@"ylt_dataSource"]) {
        obj = [((NSDictionary *) self.ylt_sourceData) objectForKey:@"ylt_dataSource"];
    }
    return obj;
}

- (void)setYlt_router:(NSString *)ylt_router {
    objc_setAssociatedObject(self, @selector(ylt_router), ylt_router, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)ylt_router {
    NSString *obj = objc_getAssociatedObject(self, @selector(ylt_router));
    if (obj == nil && [((NSDictionary *) self.ylt_sourceData).allKeys containsObject:@"ylt_router"]) {
        obj = [((NSDictionary *) self.ylt_sourceData) objectForKey:@"ylt_router"];
    }
    return obj;
}

- (void)setYlt_countPreRow:(NSInteger)ylt_countPreRow {
    objc_setAssociatedObject(self, @selector(ylt_countPreRow), @(ylt_countPreRow), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)ylt_countPreRow {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_countPreRow));
    if (obj.integerValue == 0) {
        if ([((NSDictionary *) self.ylt_sourceData).allKeys containsObject:@"ylt_countPreRow"]) {
            return [[((NSDictionary *) self.ylt_sourceData) objectForKey:@"ylt_countPreRow"] integerValue];
        }
    } else {
        return obj.integerValue;
    }
    return 1;
}

- (void)setYlt_topMargin:(CGFloat)ylt_topMargin {
    objc_setAssociatedObject(self, @selector(ylt_topMargin), @(ylt_topMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_topMargin {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_topMargin));
    if (obj.floatValue == 0) {
        if ([((NSDictionary *) self.ylt_sourceData).allKeys containsObject:@"ylt_topMargin"]) {
            return [[((NSDictionary *) self.ylt_sourceData) objectForKey:@"ylt_topMargin"] floatValue];
        }
    } else {
        return obj.floatValue;
    }
    return 16.;
}

- (void)setYlt_bottomMargin:(CGFloat)ylt_bottomMargin {
    objc_setAssociatedObject(self, @selector(ylt_bottomMargin), @(ylt_bottomMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_bottomMargin {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_bottomMargin));
    if (obj.floatValue == 0) {
        if ([((NSDictionary *) self.ylt_sourceData).allKeys containsObject:@"ylt_bottomMargin"]) {
            return [[((NSDictionary *) self.ylt_sourceData) objectForKey:@"ylt_bottomMargin"] floatValue];
        }
    } else {
        return obj.floatValue;
    }
    return 16.;
}

- (void)setYlt_leftMargin:(CGFloat)ylt_leftMargin {
    objc_setAssociatedObject(self, @selector(ylt_leftMargin), @(ylt_leftMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_leftMargin {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_leftMargin));
    if (obj.floatValue == 0) {
        if ([((NSDictionary *) self.ylt_sourceData).allKeys containsObject:@"ylt_leftMargin"]) {
            return [[((NSDictionary *) self.ylt_sourceData) objectForKey:@"ylt_leftMargin"] floatValue];
        }
    } else {
        return obj.floatValue;
    }
    return 16.;
}

- (void)setYlt_rightMargin:(CGFloat)ylt_rightMargin {
    objc_setAssociatedObject(self, @selector(ylt_rightMargin), @(ylt_rightMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_rightMargin {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_rightMargin));
    if (obj.floatValue == 0) {
        if ([((NSDictionary *) self.ylt_sourceData).allKeys containsObject:@"ylt_rightMargin"]) {
            return [[((NSDictionary *) self.ylt_sourceData) objectForKey:@"ylt_rightMargin"] floatValue];
        }
    } else {
        return obj.floatValue;
    }
    return 16.;
}

- (void)setYlt_spacing:(CGFloat)ylt_spacing {
    objc_setAssociatedObject(self, @selector(ylt_spacing), @(ylt_spacing), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_spacing {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_spacing));
    if (obj.floatValue == 0) {
        if ([((NSDictionary *) self.ylt_sourceData).allKeys containsObject:@"ylt_spacing"]) {
            return [[((NSDictionary *) self.ylt_sourceData) objectForKey:@"ylt_spacing"] floatValue];
        }
    } else {
        return obj.floatValue;
    }
    return 8.;
}

- (void)setYlt_width:(CGFloat)ylt_width {
    objc_setAssociatedObject(self, @selector(ylt_width), @(ylt_width), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_width {
    return [objc_getAssociatedObject(self, @selector(ylt_width)) floatValue];
}

- (void)setYlt_height:(CGFloat)ylt_height {
    objc_setAssociatedObject(self, @selector(ylt_height), @(ylt_height), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_height {
    return [objc_getAssociatedObject(self, @selector(ylt_height)) floatValue];
}

- (void)setYlt_ratio:(CGFloat)ylt_ratio {
    objc_setAssociatedObject(self, @selector(ylt_ratio), @(ylt_ratio), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_ratio {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_ratio));
    if (obj.floatValue == 0) {
        if ([((NSDictionary *) self.ylt_sourceData).allKeys containsObject:@"ylt_ratio"]) {
            return [[((NSDictionary *) self.ylt_sourceData) objectForKey:@"ylt_ratio"] floatValue];
        }
    } else {
        return obj.floatValue;
    }
    return 16./9.;
}

- (void)setYlt_cellClassName:(NSString *)ylt_cellClassName {
    objc_setAssociatedObject(self, @selector(ylt_cellClassName), ylt_cellClassName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)ylt_cellClassName {
    return objc_getAssociatedObject(self, @selector(ylt_cellClassName));
}

@end
