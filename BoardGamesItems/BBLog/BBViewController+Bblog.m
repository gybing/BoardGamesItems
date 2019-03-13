#import "BBViewController+Bblog.h"
@implementation BBViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog {
    return bblog % 7 == 0;
}

@end
