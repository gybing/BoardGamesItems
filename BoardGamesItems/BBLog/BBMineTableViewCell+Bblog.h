#import <UIKit/UIKit.h>
#import "BBMineTableViewCell.h"

@interface BBMineTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog;
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog;
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog;

@end
