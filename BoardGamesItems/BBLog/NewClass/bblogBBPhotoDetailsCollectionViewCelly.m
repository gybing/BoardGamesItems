#import "bblogBBPhotoDetailsCollectionViewCelly.h"
@implementation bblogBBPhotoDetailsCollectionViewCelly
+ (BOOL)oInitwithframe:(NSInteger)bblog {
    return bblog % 11 == 0;
}
+ (BOOL)JSetalbumimage:(NSInteger)bblog {
    return bblog % 27 == 0;
}

@end
