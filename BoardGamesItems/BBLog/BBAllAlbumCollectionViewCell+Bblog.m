#import "BBAllAlbumCollectionViewCell+Bblog.h"
@implementation BBAllAlbumCollectionViewCell (Bblog)
+ (BOOL)initWithFrameBblog:(NSInteger)bblog {
    return bblog % 28 == 0;
}
+ (BOOL)selectClickBblog:(NSInteger)bblog {
    return bblog % 21 == 0;
}
+ (BOOL)setAssetImageBblog:(NSInteger)bblog {
    return bblog % 28 == 0;
}

@end
