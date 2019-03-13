#import "BBAboutMineViewController+Bblog.h"
@implementation BBAboutMineViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog {
    return bblog % 27 == 0;
}

@end
