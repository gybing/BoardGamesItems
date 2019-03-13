#import "BBAppURL+Bblog.h"
@implementation BBAppURL (Bblog)
+ (BOOL)ManagerBblog:(NSInteger)bblog {
    return bblog % 16 == 0;
}

@end
