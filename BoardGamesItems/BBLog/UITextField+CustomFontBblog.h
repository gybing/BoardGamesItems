#import <UIKit/UIKit.h>
#import "UITextField+CustomFont.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"

@interface UITextField (CustomFontBblog)
+ (BOOL)loadBblog:(NSInteger)bblog;
+ (BOOL)myWillMoveToSuperviewBblog:(NSInteger)bblog;
+ (BOOL)myDidMoveToWindowBblog:(NSInteger)bblog;
+ (BOOL)FontSizeBblog:(NSInteger)bblog;
+ (BOOL)setFontSizeBblog:(NSInteger)bblog;
+ (BOOL)FontColorBblog:(NSInteger)bblog;
+ (BOOL)setFontColorBblog:(NSInteger)bblog;

@end
