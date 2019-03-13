#import "UIViewController+TouchAvatar.h"
#import "JS3DImageViewController.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"
#import "UIViewController+BackgroundAlpha.h"
@implementation UIViewController (TouchAvatar)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSel = @selector(viewDidLoad);
        SEL swizzSel = @selector(sm_viewDidLoad);
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
        if (isAdd) {
            class_replaceMethod(self, swizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        } else {
            method_exchangeImplementations(systemMethod, swizzMethod);
        }
        [self customGlobleNav];
        [self js_customBackButton];
    });
}
- (void)sm_viewDidLoad {
    [self sm_viewDidLoad];
    if([NSStringFromClass([self class]) isEqualToString:@"LLRegResultViewController"]){
        [self.navigationController setNavigationBarHidden:YES];
    }
}
+ (void)js_customBackButton {
    NSBundle* smbundle = [NSBundle bundleForClass:NSClassFromString(@"BBJS3DImageViewController")];
    UIImage* backImage = [UIImage imageNamed:@"po_left_arrow" inBundle:smbundle compatibleWithTraitCollection:nil];
    [[UINavigationBar appearance] setBackIndicatorImage:backImage];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backImage];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-1500, 0) forBarMetrics:UIBarMetricsDefault];
}
+(void)customGlobleNav
{
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.690 green:0.690 blue:0.690 alpha:1.00]];
    [[UINavigationBar appearance]setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    if([UIFont fontNamesForFamilyName:@"Microsoft YaHei"]){
        UIFont* font = [UIFont fontWithName:@"Microsoft YaHei" size:18];
        if(font){
            [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:font}];
        }
    }
}
-(void)reigsterAvatar3DTouch:(UIImageView *)avatarImageView
{
    if (@available(iOS 9.0, *)) {
        avatarImageView.userInteractionEnabled = YES;
        [self registerForPreviewingWithDelegate:self sourceView:avatarImageView];
    }
}
-(UIViewController*)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    if (@available(iOS 9.0, *)){
        JS3DImageViewController* previewing = [JS3DImageViewController new];
        UIImageView* imageView = (UIImageView*)previewingContext.sourceView;
        previewing.avatarImage.image = imageView.image;
        return previewing;
    }else{
        return nil;
    }
}
@end
