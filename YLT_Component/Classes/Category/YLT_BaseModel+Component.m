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
    return objc_getAssociatedObject(self, @selector(ylt_dataSource));
}

- (void)setYlt_router:(NSString *)ylt_router {
    objc_setAssociatedObject(self, @selector(ylt_router), ylt_router, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)ylt_router {
    return objc_getAssociatedObject(self, @selector(ylt_router));
}

- (void)setYlt_countPreRow:(NSInteger)ylt_countPreRow {
    objc_setAssociatedObject(self, @selector(ylt_countPreRow), @(ylt_countPreRow), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)ylt_countPreRow {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_countPreRow));
    return obj ? [obj integerValue] : 1;
}

- (void)setYlt_topMargin:(CGFloat)ylt_topMargin {
    objc_setAssociatedObject(self, @selector(ylt_topMargin), @(ylt_topMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_topMargin {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_topMargin));
    return obj ? [obj floatValue] : 16.;
}

- (void)setYlt_bottomMargin:(CGFloat)ylt_bottomMargin {
    objc_setAssociatedObject(self, @selector(ylt_bottomMargin), @(ylt_bottomMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_bottomMargin {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_bottomMargin));
    return obj ? [obj floatValue] : 16.;
}

- (void)setYlt_leftMargin:(CGFloat)ylt_leftMargin {
    objc_setAssociatedObject(self, @selector(ylt_leftMargin), @(ylt_leftMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_leftMargin {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_leftMargin));
    return obj ? [obj floatValue] : 16.;
}

- (void)setYlt_rightMargin:(CGFloat)ylt_rightMargin {
    objc_setAssociatedObject(self, @selector(ylt_rightMargin), @(ylt_rightMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_rightMargin {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_rightMargin));
    return obj ? [obj floatValue] : 16.;
}

- (void)setYlt_spacing:(CGFloat)ylt_spacing {
    objc_setAssociatedObject(self, @selector(ylt_spacing), @(ylt_spacing), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ylt_spacing {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ylt_rightMargin));
    return obj ? [obj floatValue] : 8.;
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
    return obj ? [obj floatValue] : 16./9.;
}

- (void)setYlt_cellClassName:(NSString *)ylt_cellClassName {
    objc_setAssociatedObject(self, @selector(ylt_cellClassName), ylt_cellClassName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)ylt_cellClassName {
    return objc_getAssociatedObject(self, @selector(ylt_cellClassName));
}

@end
