#import "bblogNSStringk.h"
@implementation bblogNSStringk
+ (BOOL)GisStringCodeWithString:(NSInteger)bblog {
    return bblog % 3 == 0;
}
+ (BOOL)AcodeStringToDictionary:(NSInteger)bblog {
    return bblog % 34 == 0;
}

@end
