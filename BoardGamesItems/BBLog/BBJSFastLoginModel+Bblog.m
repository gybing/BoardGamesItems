#import "BBJSFastLoginModel+Bblog.h"
@implementation BBJSFastLoginModel (Bblog)
+ (BOOL)initBblog:(NSInteger)bblog {
    return bblog % 4 == 0;
}
+ (BOOL)encodeWithCoderBblog:(NSInteger)bblog {
    return bblog % 33 == 0;
}
+ (BOOL)initWithCoderBblog:(NSInteger)bblog {
    return bblog % 2 == 0;
}

@end
