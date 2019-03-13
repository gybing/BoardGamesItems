#import "bblogBBMineTableViewCellp.h"
@implementation bblogBBMineTableViewCellp
+ (BOOL)mCellwithtableview:(NSInteger)bblog {
    return bblog % 44 == 0;
}
+ (BOOL)jawakeFromNib:(NSInteger)bblog {
    return bblog % 28 == 0;
}
+ (BOOL)XSetselectedmAnimated:(NSInteger)bblog {
    return bblog % 33 == 0;
}

@end
