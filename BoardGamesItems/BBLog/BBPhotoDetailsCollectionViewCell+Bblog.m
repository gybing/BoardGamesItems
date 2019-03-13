#import "BBPhotoDetailsCollectionViewCell+Bblog.h"
@implementation BBPhotoDetailsCollectionViewCell (Bblog)
+ (BOOL)initWithFrameBblog:(NSInteger)bblog {
    return bblog % 36 == 0;
}
+ (BOOL)setAlbumImageBblog:(NSInteger)bblog {
    return bblog % 50 == 0;
}

@end
