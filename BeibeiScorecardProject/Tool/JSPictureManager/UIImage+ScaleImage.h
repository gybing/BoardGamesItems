#import <UIKit/UIKit.h>
@interface UIImage (ScaleImage)
+ (UIImage*)image:(UIImage *)image ByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage *)scaleImageToSize:(CGSize)newSize;
@end
