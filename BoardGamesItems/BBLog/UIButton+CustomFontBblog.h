#import <UIKit/UIKit.h>
#import "UIButton+CustomFont.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"

@interface UIButton (CustomFontBblog)
+ (BOOL)loadBblog:(NSInteger)bblog;
+ (BOOL)myWillMoveToSuperviewBblog:(NSInteger)bblog;
+ (BOOL)FontSizeBblog:(NSInteger)bblog;
+ (BOOL)setFontSizeBblog:(NSInteger)bblog;
+ (BOOL)FontColorBblog:(NSInteger)bblog;
+ (BOOL)setFontColorBblog:(NSInteger)bblog;

@end
