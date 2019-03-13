#import "UITextView+CustomFontBblog.h"
@implementation UITextView (CustomFontBblog)
+ (BOOL)loadBblog:(NSInteger)bblog {
    return bblog % 40 == 0;
}
+ (BOOL)myWillMoveToSuperviewBblog:(NSInteger)bblog {
    return bblog % 17 == 0;
}
+ (BOOL)setupTextViewBblog:(NSInteger)bblog {
    return bblog % 6 == 0;
}
+ (BOOL)PlaceHolderBblog:(NSInteger)bblog {
    return bblog % 36 == 0;
}
+ (BOOL)setPlaceHolderBblog:(NSInteger)bblog {
    return bblog % 23 == 0;
}
+ (BOOL)FontSizeBblog:(NSInteger)bblog {
    return bblog % 10 == 0;
}
+ (BOOL)setFontSizeBblog:(NSInteger)bblog {
    return bblog % 50 == 0;
}
+ (BOOL)FontColorBblog:(NSInteger)bblog {
    return bblog % 5 == 0;
}
+ (BOOL)setFontColorBblog:(NSInteger)bblog {
    return bblog % 2 == 0;
}

@end
