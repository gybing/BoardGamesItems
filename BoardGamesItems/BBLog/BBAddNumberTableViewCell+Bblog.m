#import "BBAddNumberTableViewCell+Bblog.h"
@implementation BBAddNumberTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog {
    return bblog % 35 == 0;
}
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog {
    return bblog % 32 == 0;
}
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog {
    return bblog % 36 == 0;
}

@end
