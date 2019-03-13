#import <UIKit/UIKit.h>
#import "BBMineViewController.h"
#import "BBKPersonViewController.h"
#import "BBMineTableViewCell.h"
#import "BBAboutMineViewController.h"
#import "BBMMCleanCacheManager.h"
#import "BBKOpinionViewController.h"
#import "BBDelegateViewController.h"

@interface BBMineViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)viewWillAppearBblog:(NSInteger)bblog;
+ (BOOL)viewWillDisappearBblog:(NSInteger)bblog;
+ (BOOL)cusotmHeaderViewBblog:(NSInteger)bblog;
+ (BOOL)setUpHeaderImageBblog:(NSInteger)bblog;
+ (BOOL)scrollViewDidScrollBblog:(NSInteger)bblog;
+ (BOOL)imageWithColorBblog:(NSInteger)bblog;
+ (BOOL)numberOfSectionsInTableViewBblog:(NSInteger)bblog;
+ (BOOL)tableViewNumberofrowsinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforheaderinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewViewforheaderinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewCellforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewDidselectrowatindexpathBblog:(NSInteger)bblog;

@end
