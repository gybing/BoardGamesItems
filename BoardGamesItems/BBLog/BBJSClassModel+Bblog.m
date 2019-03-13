#import "BBJSClassModel+Bblog.h"
@implementation BBJSClassModel (Bblog)
+ (BOOL)initBblog:(NSInteger)bblog {
    return bblog % 14 == 0;
}
+ (BOOL)encodeWithCoderBblog:(NSInteger)bblog {
    return bblog % 47 == 0;
}
+ (BOOL)initWithCoderBblog:(NSInteger)bblog {
    return bblog % 12 == 0;
}

@end
