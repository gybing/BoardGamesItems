#import <UIKit/UIKit.h>
#import "BBAppDelegate.h"
#import "BBIudgeViewController.h"
#import "BBAppURL.h"
#import<CoreTelephony/CTCellularData.h>
#import "AFNetworkReachabilityManager.h"
#import  <UMCommon/UMCommon.h>  
#import  <UMPush/UMessage.h>  
#import  <UserNotifications/UserNotifications.h>

@interface BBAppDelegate (Bblog)
+ (BOOL)applicationDidfinishlaunchingwithoptionsBblog:(NSInteger)bblog;
+ (BOOL)networkStatusDidfinishlaunchingwithoptionsBblog:(NSInteger)bblog;
+ (BOOL)addReachabilityManagerDidfinishlaunchingwithoptionsBblog:(NSInteger)bblog;
+ (BOOL)getInfo_applicationDidfinishlaunchingwithoptionsBblog:(NSInteger)bblog;
+ (BOOL)applicationWillResignActiveBblog:(NSInteger)bblog;
+ (BOOL)applicationDidEnterBackgroundBblog:(NSInteger)bblog;
+ (BOOL)applicationWillEnterForegroundBblog:(NSInteger)bblog;
+ (BOOL)applicationDidBecomeActiveBblog:(NSInteger)bblog;
+ (BOOL)applicationWillTerminateBblog:(NSInteger)bblog;
+ (BOOL)configureUMessageWithLaunchOptionsBblog:(NSInteger)bblog;
+ (BOOL)applicationDidreceiveremotenotificationBblog:(NSInteger)bblog;
+ (BOOL)applicationDidreceiveremotenotificationFetchcompletionhandlerBblog:(NSInteger)bblog;
+ (BOOL)applicationDidregisterforremotenotificationswithdevicetokenBblog:(NSInteger)bblog;

@end
