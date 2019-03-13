#import "BBGroupTableViewCell+Bblog.h"
@implementation BBGroupTableViewCell (Bblog)
+ (BOOL)initWithStyleReuseidentifierBblog:(NSInteger)bblog {
    return bblog % 27 == 0;
}
+ (BOOL)setNameImageBblog:(NSInteger)bblog {
    return bblog % 39 == 0;
}
+ (BOOL)setNameTitleBblog:(NSInteger)bblog {
    return bblog % 9 == 0;
}

@end
