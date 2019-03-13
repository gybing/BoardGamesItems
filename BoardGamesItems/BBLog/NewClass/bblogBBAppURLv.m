#import "bblogBBAppURLv.h"
@implementation bblogBBAppURLv
+ (BOOL)PManager:(NSInteger)bblog {
    return bblog % 27 == 0;
}

@end
