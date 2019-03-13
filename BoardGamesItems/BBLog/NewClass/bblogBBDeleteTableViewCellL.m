#import "bblogBBDeleteTableViewCellL.h"
@implementation bblogBBDeleteTableViewCellL
+ (BOOL)LCellwithtableview:(NSInteger)bblog {
    return bblog % 13 == 0;
}
+ (BOOL)WawakeFromNib:(NSInteger)bblog {
    return bblog % 48 == 0;
}
+ (BOOL)qSetselectedQAnimated:(NSInteger)bblog {
    return bblog % 3 == 0;
}

@end
