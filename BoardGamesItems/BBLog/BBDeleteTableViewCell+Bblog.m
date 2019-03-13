#import "BBDeleteTableViewCell+Bblog.h"
@implementation BBDeleteTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog {
    return bblog % 8 == 0;
}
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog {
    return bblog % 35 == 0;
}
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog {
    return bblog % 35 == 0;
}

@end
