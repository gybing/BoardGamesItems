#import <UIKit/UIKit.h>
#import "UIViewController+TouchAvatar.h"
#import "BBJS3DImageViewController.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"
#import "UIViewController+BackgroundAlpha.h"

@interface UIViewController (TouchAvatarBblog)
+ (BOOL)loadBblog:(NSInteger)bblog;
+ (BOOL)sm_viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)js_customBackButtonBblog:(NSInteger)bblog;
+ (BOOL)customGlobleNavBblog:(NSInteger)bblog;
+ (BOOL)reigsterAvatar3DTouchBblog:(NSInteger)bblog;
+ (BOOL)previewingContextViewcontrollerforlocationBblog:(NSInteger)bblog;

@end
