#import "bblogBBFillContantTableViewCellh.h"
@implementation bblogBBFillContantTableViewCellh
+ (BOOL)eCellwithtableview:(NSInteger)bblog {
    return bblog % 44 == 0;
}
+ (BOOL)LawakeFromNib:(NSInteger)bblog {
    return bblog % 44 == 0;
}
+ (BOOL)KSetselectedvAnimated:(NSInteger)bblog {
    return bblog % 14 == 0;
}

@end
