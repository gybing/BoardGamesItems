#import "UIViewController+BackgroundAlpha.h"
#import <objc/runtime.h>
@implementation UIViewController (BackgroundAlpha)
-(void)js_setAutomaticallyAdjustsScrollViewInsets_No:(UIScrollView*)scrollView
{
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}
- (void)js_setStatusBarStyle:(UIStatusBarStyle)style
{
    [UIApplication sharedApplication].statusBarStyle = style;
    [self setNeedsStatusBarAppearanceUpdate];
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
@end
