#import "bblogBBViewControllerh.h"
@implementation bblogBBViewControllerh
+ (BOOL)PviewDidLoad:(NSInteger)bblog {
    return bblog % 20 == 0;
}

@end
