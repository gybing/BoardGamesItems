#import <UIKit/UIKit.h>
#import "BBIudgeViewController.h"
#import "BBKTransferViewController.h"
#import "BBRootTabBarViewController.h"
#import "BBDelegateViewController.h"
#import "AFNetworkReachabilityManager.h"
#import "BBAppURL.h"
#import "BBAppDeviceMode.h"
#import "BBXXRequest.h"
#import "NSString+Code.h"

@interface BBIudgeViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)compareDateWithdateBblog:(NSInteger)bblog;
+ (BOOL)isReachableBblog:(NSInteger)bblog;
+ (BOOL)requestMainURLBblog:(NSInteger)bblog;
+ (BOOL)judgeIsWebViewBblog:(NSInteger)bblog;

@end
