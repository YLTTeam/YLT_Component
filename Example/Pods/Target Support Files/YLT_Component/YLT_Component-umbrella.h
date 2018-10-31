#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YLT_BaseComponentCell.h"
#import "YLT_ComponentProtocol.h"
#import "YLT_BaseModel+Component.h"
#import "YLT_ComponentRouter.h"
#import "YLT_ComponentVC+Delegate.h"
#import "YLT_ComponentVC.h"
#import "YLT_PalaceMenuView.h"
#import "YLT_Component.h"

FOUNDATION_EXPORT double YLT_ComponentVersionNumber;
FOUNDATION_EXPORT const unsigned char YLT_ComponentVersionString[];

