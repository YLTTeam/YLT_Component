//
//  YLT_DotView.m
//  AFNetworking
//
//  Created by 项普华 on 2018/11/21.
//

#import "YLT_DotView.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

static CGFloat const kAnimateDuration = 1;

@implementation YLT_DotView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    self.backgroundColor = @"CCCCCCAF".ylt_colorFromHexString;
    self.layer.cornerRadius = 2;
}

- (void)changeActivityState:(BOOL)active {
    if (active) {
        [self animateToActiveState];
    } else {
        [self animateToDeactiveState];
    }
}

- (void)animateToActiveState {
    self.backgroundColor = @"666666AF".ylt_colorFromHexString;
}

- (void)animateToDeactiveState {
    self.backgroundColor = @"CCCCCCAF".ylt_colorFromHexString;
}

@end
