#import "BBDetailViewController+Bblog.h"
@implementation BBDetailViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog {
    return bblog % 20 == 0;
}
+ (BOOL)getTotalDataBblog:(NSInteger)bblog {
    return bblog % 3 == 0;
}
+ (BOOL)addGameNumberBtnBblog:(NSInteger)bblog {
    return bblog % 8 == 0;
}
+ (BOOL)numberOfSectionsInTableViewBblog:(NSInteger)bblog {
    return bblog % 10 == 0;
}
+ (BOOL)tableViewNumberofrowsinsectionBblog:(NSInteger)bblog {
    return bblog % 22 == 0;
}
+ (BOOL)tableViewHeightforrowatindexpathBblog:(NSInteger)bblog {
    return bblog % 9 == 0;
}
+ (BOOL)tableViewHeightforheaderinsectionBblog:(NSInteger)bblog {
    return bblog % 30 == 0;
}
+ (BOOL)tableViewViewforheaderinsectionBblog:(NSInteger)bblog {
    return bblog % 13 == 0;
}
+ (BOOL)tableViewCellforrowatindexpathBblog:(NSInteger)bblog {
    return bblog % 8 == 0;
}
+ (BOOL)tableViewDidselectrowatindexpathBblog:(NSInteger)bblog {
    return bblog % 26 == 0;
}

@end
