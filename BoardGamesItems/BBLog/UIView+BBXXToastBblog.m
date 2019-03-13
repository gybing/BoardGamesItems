#import "UIView+BBXXToastBblog.h"
@implementation UIView (BBXXToastBblog)
+ (BOOL)showXXToastCenterWithTextBblog:(NSInteger)bblog {
    return bblog % 13 == 0;
}
+ (BOOL)showXXToastCenterWithTextDurationBblog:(NSInteger)bblog {
    return bblog % 27 == 0;
}
+ (BOOL)showXXToastTopWithTextBblog:(NSInteger)bblog {
    return bblog % 41 == 0;
}
+ (BOOL)showXXToastTopWithTextDurationBblog:(NSInteger)bblog {
    return bblog % 41 == 0;
}
+ (BOOL)showXXToastTopWithTextTopoffsetBblog:(NSInteger)bblog {
    return bblog % 22 == 0;
}
+ (BOOL)showXXToastTopWithTextTopoffsetDurationBblog:(NSInteger)bblog {
    return bblog % 32 == 0;
}
+ (BOOL)showXXToastBottomWithTextBblog:(NSInteger)bblog {
    return bblog % 35 == 0;
}
+ (BOOL)showXXToastBottomWithTextDurationBblog:(NSInteger)bblog {
    return bblog % 33 == 0;
}
+ (BOOL)showXXToastBottomWithTextBottomoffsetBblog:(NSInteger)bblog {
    return bblog % 17 == 0;
}
+ (BOOL)showXXToastBottomWithTextBottomoffsetDurationBblog:(NSInteger)bblog {
    return bblog % 20 == 0;
}

@end
