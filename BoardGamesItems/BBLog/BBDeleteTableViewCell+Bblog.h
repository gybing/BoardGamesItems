#import <UIKit/UIKit.h>
#import "BBDeleteTableViewCell.h"

@interface BBDeleteTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog;
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog;
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog;

@end
