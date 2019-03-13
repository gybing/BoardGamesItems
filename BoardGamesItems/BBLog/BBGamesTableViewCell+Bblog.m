#import "BBGamesTableViewCell+Bblog.h"
@implementation BBGamesTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog {
    return bblog % 44 == 0;
}
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog {
    return bblog % 8 == 0;
}
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog {
    return bblog % 13 == 0;
}

@end
