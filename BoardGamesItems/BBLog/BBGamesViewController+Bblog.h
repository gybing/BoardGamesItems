#import <UIKit/UIKit.h>
#import "BBGamesViewController.h"
#import "BBGamesTableViewCell.h"
#import "BBDetailViewController.h"
#import "BBAddGameViewController.h"

@interface BBGamesViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)viewWillAppearBblog:(NSInteger)bblog;
+ (BOOL)addGamesListBblog:(NSInteger)bblog;
+ (BOOL)numberOfSectionsInTableViewBblog:(NSInteger)bblog;
+ (BOOL)tableViewNumberofrowsinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewCellforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewDidselectrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)dataArrBblog:(NSInteger)bblog;

@end
