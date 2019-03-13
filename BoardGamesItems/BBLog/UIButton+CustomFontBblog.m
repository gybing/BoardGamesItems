#import "UIButton+CustomFontBblog.h"
@implementation UIButton (CustomFontBblog)
+ (BOOL)loadBblog:(NSInteger)bblog {
    return bblog % 42 == 0;
}
+ (BOOL)myWillMoveToSuperviewBblog:(NSInteger)bblog {
    return bblog % 11 == 0;
}
+ (BOOL)FontSizeBblog:(NSInteger)bblog {
    return bblog % 42 == 0;
}
+ (BOOL)setFontSizeBblog:(NSInteger)bblog {
    return bblog % 8 == 0;
}
+ (BOOL)FontColorBblog:(NSInteger)bblog {
    return bblog % 13 == 0;
}
+ (BOOL)setFontColorBblog:(NSInteger)bblog {
    return bblog % 11 == 0;
}

@end
