#import "bblogBBAllAlbumCollectionViewCellQ.h"
@implementation bblogBBAllAlbumCollectionViewCellQ
+ (BOOL)BInitwithframe:(NSInteger)bblog {
    return bblog % 14 == 0;
}
+ (BOOL)MSelectclick:(NSInteger)bblog {
    return bblog % 46 == 0;
}
+ (BOOL)ESetassetimage:(NSInteger)bblog {
    return bblog % 17 == 0;
}

@end
