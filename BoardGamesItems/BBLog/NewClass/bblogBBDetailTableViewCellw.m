#import "bblogBBDetailTableViewCellw.h"
@implementation bblogBBDetailTableViewCellw
+ (BOOL)mCellwithtableview:(NSInteger)bblog {
    return bblog % 9 == 0;
}
+ (BOOL)zawakeFromNib:(NSInteger)bblog {
    return bblog % 7 == 0;
}
+ (BOOL)KSetselectedkAnimated:(NSInteger)bblog {
    return bblog % 2 == 0;
}

@end
