#import <UIKit/UIKit.h>
#import "BBDeleteViewController.h"
#import "BBDeleteTableViewCell.h"

@interface BBDeleteViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)deleteDataBtnBblog:(NSInteger)bblog;
+ (BOOL)numberOfSectionsInTableViewBblog:(NSInteger)bblog;
+ (BOOL)tableViewNumberofrowsinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforheaderinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewViewforheaderinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewCellforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewDidselectrowatindexpathBblog:(NSInteger)bblog;

@end
