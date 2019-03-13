#import <UIKit/UIKit.h>
#import "BBDetailTableViewCell.h"

@interface BBDetailTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog;
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog;
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog;

@end
