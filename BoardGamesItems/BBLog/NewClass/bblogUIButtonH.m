#import "bblogUIButtonH.h"
@implementation bblogUIButtonH
+ (BOOL)Tload:(NSInteger)bblog {
    return bblog % 27 == 0;
}
+ (BOOL)pMywillmovetosuperview:(NSInteger)bblog {
    return bblog % 45 == 0;
}
+ (BOOL)FFontSize:(NSInteger)bblog {
    return bblog % 50 == 0;
}
+ (BOOL)pSetfontsize:(NSInteger)bblog {
    return bblog % 37 == 0;
}
+ (BOOL)oFontColor:(NSInteger)bblog {
    return bblog % 39 == 0;
}
+ (BOOL)GSetfontcolor:(NSInteger)bblog {
    return bblog % 19 == 0;
}

@end
