#import "UIView+addGradualLayer.h"
@implementation UIView (addGradualLayer)
- (void)addGradualLayerWithColors: (NSArray *)colors
                       layerframe: (CGRect)frame
                       startPoint: (CGPoint)startPoint
                         endPoint: (CGPoint)endPoint
{
    CAGradientLayer *_gradientLayer = [CAGradientLayer layer];
    _gradientLayer.startPoint = startPoint;
    _gradientLayer.endPoint = endPoint;
    _gradientLayer.frame = frame;
    _gradientLayer.colors = colors;
    [self.layer insertSublayer:_gradientLayer atIndex:0];
}
- (UIImage *)convertImage
{
    CGSize s = self.bounds.size;
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
