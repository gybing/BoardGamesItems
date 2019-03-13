#import "UIImage+ScaleImageBblog.h"
@implementation UIImage (ScaleImageBblog)
+ (BOOL)imageByscalingandcroppingforsizeBblog:(NSInteger)bblog {
    return bblog % 1 == 0;
}
+ (BOOL)scaleImageToSizeBblog:(NSInteger)bblog {
    return bblog % 4 == 0;
}

@end
