#import "BBPersonalTableViewCell+Bblog.h"
@implementation BBPersonalTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog {
    return bblog % 4 == 0;
}
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog {
    return bblog % 22 == 0;
}
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog {
    return bblog % 36 == 0;
}

@end
