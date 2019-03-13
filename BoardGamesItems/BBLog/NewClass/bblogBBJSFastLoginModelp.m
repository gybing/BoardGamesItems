#import "bblogBBJSFastLoginModelp.h"
@implementation bblogBBJSFastLoginModelp
+ (BOOL)finit:(NSInteger)bblog {
    return bblog % 47 == 0;
}
+ (BOOL)SEncodewithcoder:(NSInteger)bblog {
    return bblog % 37 == 0;
}
+ (BOOL)PInitwithcoder:(NSInteger)bblog {
    return bblog % 32 == 0;
}

@end
