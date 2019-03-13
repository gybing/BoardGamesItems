#import <UIKit/UIKit.h>
#import "BBDetailViewController.h"
#import "BBDetailTableViewCell.h"
#import "BBDeleteViewController.h"
#import "BBAddNumberViewController.h"

@interface BBDetailViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)getTotalDataBblog:(NSInteger)bblog;
+ (BOOL)addGameNumberBtnBblog:(NSInteger)bblog;
+ (BOOL)numberOfSectionsInTableViewBblog:(NSInteger)bblog;
+ (BOOL)tableViewNumberofrowsinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforheaderinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewViewforheaderinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewCellforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewDidselectrowatindexpathBblog:(NSInteger)bblog;

@end
