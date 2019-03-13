#import <UIKit/UIKit.h>
#import "UILabel+CustomFont.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"

@interface UILabel (CustomFontBblog)
+ (BOOL)loadBblog:(NSInteger)bblog;
+ (BOOL)myWillMoveToSuperviewBblog:(NSInteger)bblog;
+ (BOOL)FontSizeBblog:(NSInteger)bblog;
+ (BOOL)setFontSizeBblog:(NSInteger)bblog;
+ (BOOL)FontColorBblog:(NSInteger)bblog;
+ (BOOL)setFontColorBblog:(NSInteger)bblog;
+ (BOOL)canPerformActionWithsenderBblog:(NSInteger)bblog;
+ (BOOL)attachTapHandlerBblog:(NSInteger)bblog;
+ (BOOL)handleTapBblog:(NSInteger)bblog;
+ (BOOL)copyTextBblog:(NSInteger)bblog;
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog;
+ (BOOL)canBecomeFirstResponderBblog:(NSInteger)bblog;

@end
