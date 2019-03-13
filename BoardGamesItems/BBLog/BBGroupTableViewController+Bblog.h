#import <UIKit/UIKit.h>
#import "BBGroupTableViewController.h"
#import <Photos/Photos.h>
#import "BBGroupTableViewCell.h"
#import "BBAllAlbumViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface BBGroupTableViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)cancelBblog:(NSInteger)bblog;
+ (BOOL)getSourceBblog:(NSInteger)bblog;
+ (BOOL)authorizationStateChangeBblog:(NSInteger)bblog;
+ (BOOL)authorizationStateAuthorizedBblog:(NSInteger)bblog;
+ (BOOL)tableViewNumberofrowsinsectionBblog:(NSInteger)bblog;
+ (BOOL)tableViewCellforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewDidselectrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)tableViewHeightforrowatindexpathBblog:(NSInteger)bblog;
+ (BOOL)getchineseAlbumBblog:(NSInteger)bblog;
+ (BOOL)fetchArrayBblog:(NSInteger)bblog;
+ (BOOL)videoArrayBblog:(NSInteger)bblog;

@end
