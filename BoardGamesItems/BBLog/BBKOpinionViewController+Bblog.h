#import <UIKit/UIKit.h>
#import "BBKOpinionViewController.h"
#import "BBFillContantTableViewCell.h"
#import "BBAddNumberTableViewCell.h"
#import "AFNetworkReachabilityManager.h"

@interface BBKOpinionViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)isReachableBblog:(NSInteger)bblog;
+ (BOOL)setupOpinionBblog:(NSInteger)bblog;
+ (BOOL)numberOfSectionsInTableViewBblog:(NSInteger)bblog;
+ (BOOL)tableViewNumberofrowsinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforheaderinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewViewforheaderinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewCellforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)touchesBeganWitheventBblog:(NSInteger)bblog;
+ (BOOL)scrollViewDidScrollBblog:(NSInteger)bblog;

@end
