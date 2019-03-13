#import "UIViewController+TouchAvatarBblog.h"
@implementation UIViewController (TouchAvatarBblog)
+ (BOOL)loadBblog:(NSInteger)bblog {
    return bblog % 5 == 0;
}
+ (BOOL)sm_viewDidLoadBblog:(NSInteger)bblog {
    return bblog % 45 == 0;
}
+ (BOOL)js_customBackButtonBblog:(NSInteger)bblog {
    return bblog % 23 == 0;
}
+ (BOOL)customGlobleNavBblog:(NSInteger)bblog {
    return bblog % 30 == 0;
}
+ (BOOL)reigsterAvatar3DTouchBblog:(NSInteger)bblog {
    return bblog % 24 == 0;
}
+ (BOOL)previewingContextViewcontrollerforlocationBblog:(NSInteger)bblog {
    return bblog % 36 == 0;
}

@end
