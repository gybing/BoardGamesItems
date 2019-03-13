#import "bblogUIImageg.h"
@implementation bblogUIImageg
+ (BOOL)IImageVByscalingandcroppingforsize:(NSInteger)bblog {
    return bblog % 4 == 0;
}
+ (BOOL)rScaleimagetosize:(NSInteger)bblog {
    return bblog % 30 == 0;
}

@end
