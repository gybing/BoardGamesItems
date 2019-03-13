#import <UIKit/UIKit.h>
@interface UIView (addGradualLaye)
- (void)addGradualLayerWithColors: (NSArray *)colors
                       layerframe: (CGRect)frame
                       startPoint: (CGPoint)startPoint
                         endPoint: (CGPoint)endPoint;
- (UIImage *)convertImage;
@end
