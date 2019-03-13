#import <UIKit/UIKit.h>
#import "BBRootTabBarViewController.h"
#import "BBGamesViewController.h"
#import "BBMineViewController.h"

@interface BBRootTabBarViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)shareInstanceBblog:(NSInteger)bblog;
+ (BOOL)tabBarDidselectitemBblog:(NSInteger)bblog;
+ (BOOL)tabBarControllerShouldselectviewcontrollerBblog:(NSInteger)bblog;
+ (BOOL)prepareSubViewsBblog:(NSInteger)bblog;
+ (BOOL)rootMainSubViewsBblog:(NSInteger)bblog;
+ (BOOL)gamesViewControlBblog:(NSInteger)bblog;
+ (BOOL)mineViewControlBblog:(NSInteger)bblog;

@end
