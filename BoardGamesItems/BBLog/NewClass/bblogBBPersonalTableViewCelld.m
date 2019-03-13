#import "bblogBBPersonalTableViewCelld.h"
@implementation bblogBBPersonalTableViewCelld
+ (BOOL)fCellwithtableview:(NSInteger)bblog {
    return bblog % 18 == 0;
}
+ (BOOL)zawakeFromNib:(NSInteger)bblog {
    return bblog % 43 == 0;
}
+ (BOOL)HSetselectedxAnimated:(NSInteger)bblog {
    return bblog % 29 == 0;
}

@end
