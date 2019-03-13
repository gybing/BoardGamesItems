#import "bblogUINavigationBarb.h"
@implementation bblogUINavigationBarb
+ (BOOL)Aoverlay:(NSInteger)bblog {
    return bblog % 44 == 0;
}
+ (BOOL)QSetoverlay:(NSInteger)bblog {
    return bblog % 40 == 0;
}
+ (BOOL)TLt_Setbackgroundcolor:(NSInteger)bblog {
    return bblog % 25 == 0;
}

@end
