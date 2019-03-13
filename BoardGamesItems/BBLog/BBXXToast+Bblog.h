#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BBXXToast.h"

@interface BBXXToast (Bblog)
+ (BOOL)initWithTextBblog:(NSInteger)bblog;
+ (BOOL)dismissToastBblog:(NSInteger)bblog;
+ (BOOL)toastTapedBblog:(NSInteger)bblog;
+ (BOOL)showAnimationBblog:(NSInteger)bblog;
+ (BOOL)hideAnimationBblog:(NSInteger)bblog;
+ (BOOL)windowBblog:(NSInteger)bblog;
+ (BOOL)showInBblog:(NSInteger)bblog;
+ (BOOL)showInFromtopoffsetBblog:(NSInteger)bblog;
+ (BOOL)showInFrombottomoffsetBblog:(NSInteger)bblog;
+ (BOOL)showCenterWithTextBblog:(NSInteger)bblog;
+ (BOOL)showCenterWithTextDurationBblog:(NSInteger)bblog;
+ (BOOL)showTopWithTextBblog:(NSInteger)bblog;
+ (BOOL)showTopWithTextDurationBblog:(NSInteger)bblog;
+ (BOOL)showTopWithTextTopoffsetBblog:(NSInteger)bblog;
+ (BOOL)showTopWithTextTopoffsetDurationBblog:(NSInteger)bblog;
+ (BOOL)showBottomWithTextBblog:(NSInteger)bblog;
+ (BOOL)showBottomWithTextDurationBblog:(NSInteger)bblog;
+ (BOOL)showBottomWithTextBottomoffsetBblog:(NSInteger)bblog;
+ (BOOL)showBottomWithTextBottomoffsetDurationBblog:(NSInteger)bblog;

@end
