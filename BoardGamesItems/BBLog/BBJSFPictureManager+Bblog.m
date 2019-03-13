#import "BBJSFPictureManager+Bblog.h"
@implementation BBJSFPictureManager (Bblog)
+ (BOOL)sharedManagerBblog:(NSInteger)bblog {
    return bblog % 47 == 0;
}
+ (BOOL)shareGetPictureBblog:(NSInteger)bblog {
    return bblog % 10 == 0;
}
+ (BOOL)getPictureFromCameraBblog:(NSInteger)bblog {
    return bblog % 44 == 0;
}
+ (BOOL)getPictureFromAlbumBblog:(NSInteger)bblog {
    return bblog % 9 == 0;
}
+ (BOOL)getPictureFromGalleryBblog:(NSInteger)bblog {
    return bblog % 50 == 0;
}
+ (BOOL)openCameraBblog:(NSInteger)bblog {
    return bblog % 26 == 0;
}
+ (BOOL)openAlbumBblog:(NSInteger)bblog {
    return bblog % 21 == 0;
}
+ (BOOL)openGalleryBblog:(NSInteger)bblog {
    return bblog % 21 == 0;
}
+ (BOOL)setImagePickerControllerWithBblog:(NSInteger)bblog {
    return bblog % 41 == 0;
}
+ (BOOL)showAlertViewWithTitelBblog:(NSInteger)bblog {
    return bblog % 13 == 0;
}
+ (BOOL)imagePickerControllerDidfinishpickingmediawithinfoBblog:(NSInteger)bblog {
    return bblog % 42 == 0;
}
+ (BOOL)getMultiplePictureInViewControllerCountBlockBblog:(NSInteger)bblog {
    return bblog % 1 == 0;
}

@end
