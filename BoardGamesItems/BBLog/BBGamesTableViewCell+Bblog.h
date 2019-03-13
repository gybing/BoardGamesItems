#import <UIKit/UIKit.h>
#import "BBGamesTableViewCell.h"

@interface BBGamesTableViewCell (Bblog)
+ (BOOL)cellWithTableViewBblog:(NSInteger)bblog;
+ (BOOL)awakeFromNibBblog:(NSInteger)bblog;
+ (BOOL)setSelectedAnimatedBblog:(NSInteger)bblog;

@end
