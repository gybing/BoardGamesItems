#import "BBIudgeViewController+Bblog.h"
@implementation BBIudgeViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog {
    return bblog % 42 == 0;
}
+ (BOOL)compareDateWithdateBblog:(NSInteger)bblog {
    return bblog % 15 == 0;
}
+ (BOOL)isReachableBblog:(NSInteger)bblog {
    return bblog % 48 == 0;
}
+ (BOOL)requestMainURLBblog:(NSInteger)bblog {
    return bblog % 19 == 0;
}
+ (BOOL)judgeIsWebViewBblog:(NSInteger)bblog {
    return bblog % 20 == 0;
}

@end
