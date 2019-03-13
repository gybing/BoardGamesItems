#import <UIKit/UIKit.h>
#import "BBPersonalTableViewCell.h"

@interface BBPersonalTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog;
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog;
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog;

@end
