#import "UINavigationBar+BackgroundColorBblog.h"
@implementation UINavigationBar (BackgroundColorBblog)
+ (BOOL)overlayBblog:(NSInteger)bblog {
    return bblog % 36 == 0;
}
+ (BOOL)setOverlayBblog:(NSInteger)bblog {
    return bblog % 7 == 0;
}
+ (BOOL)lt_setBackgroundColorBblog:(NSInteger)bblog {
    return bblog % 49 == 0;
}

@end
