#import <UIKit/UIKit.h>
#import "UINavigationBar+BackgroundColor.h"
#import <objc/runtime.h>

@interface UINavigationBar (BackgroundColorBblog)
+ (BOOL)overlayBblog:(NSInteger)bblog;
+ (BOOL)setOverlayBblog:(NSInteger)bblog;
+ (BOOL)lt_setBackgroundColorBblog:(NSInteger)bblog;

@end
