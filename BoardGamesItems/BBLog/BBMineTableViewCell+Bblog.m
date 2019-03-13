#import "BBMineTableViewCell+Bblog.h"
@implementation BBMineTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog {
    return bblog % 16 == 0;
}
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog {
    return bblog % 43 == 0;
}
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog {
    return bblog % 21 == 0;
}

@end
