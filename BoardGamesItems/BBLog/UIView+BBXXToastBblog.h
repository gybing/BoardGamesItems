#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BBXXToast.h"

@interface UIView (BBXXToastBblog)
+ (BOOL)showXXToastCenterWithTextBblog:(NSInteger)bblog;
+ (BOOL)showXXToastCenterWithTextDurationBblog:(NSInteger)bblog;
+ (BOOL)showXXToastTopWithTextBblog:(NSInteger)bblog;
+ (BOOL)showXXToastTopWithTextDurationBblog:(NSInteger)bblog;
+ (BOOL)showXXToastTopWithTextTopoffsetBblog:(NSInteger)bblog;
+ (BOOL)showXXToastTopWithTextTopoffsetDurationBblog:(NSInteger)bblog;
+ (BOOL)showXXToastBottomWithTextBblog:(NSInteger)bblog;
+ (BOOL)showXXToastBottomWithTextDurationBblog:(NSInteger)bblog;
+ (BOOL)showXXToastBottomWithTextBottomoffsetBblog:(NSInteger)bblog;
+ (BOOL)showXXToastBottomWithTextBottomoffsetDurationBblog:(NSInteger)bblog;

@end
