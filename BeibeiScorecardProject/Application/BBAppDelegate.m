#import "BBAppDelegate.h"
#import "BBIudgeViewController.h"
#import "BBAppURL.h"
#import<CoreTelephony/CTCellularData.h>
#import "AFNetworkReachabilityManager.h"
//#import  <UMCommon/UMCommon.h>
//#import  <UMPush/UMessage.h>
//#import  <UserNotifications/UserNotifications.h>
//#define UMAppKey @"5c3d69bbb465f5eb60000fc9"
//*<UNUserNotificationCenterDelegate>
@interface BBAppDelegate ()
@end
@implementation BBAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.backgroundColor = [UIColor whiteColor];
    application.statusBarHidden = YES;
//    [self configureUMessageWithLaunchOptions:launchOptions];
    [BBAppURL Manager].HttpHost = @"http://www.88313.xin";
    if (__IPHONE_10_0) {
        [self networkStatus:application didFinishLaunchingWithOptions:launchOptions];
    }else {
        [self addReachabilityManager:application didFinishLaunchingWithOptions:launchOptions];
    }
    return YES;
}
- (void)networkStatus:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CTCellularData *cellularData = [[CTCellularData alloc] init];
    cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state) {
        switch (state) {
            case kCTCellularDataRestricted:
                NSLog(@"Restricted");
                [self addReachabilityManager:application didFinishLaunchingWithOptions:launchOptions];
                break;
            case kCTCellularDataNotRestricted:
                NSLog(@"NotRestricted");
                [self addReachabilityManager:application didFinishLaunchingWithOptions:launchOptions];
                break;
            case kCTCellularDataRestrictedStateUnknown:
                NSLog(@"Unknown");
                [self addReachabilityManager:application didFinishLaunchingWithOptions:launchOptions];
                break;
            default:
                break;
        }
    };
}
- (void)addReachabilityManager:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AFNetworkReachabilityManager *afNetworkReachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [afNetworkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"网络不通：%@",@(status) );
                [self getInfo_application:application didFinishLaunchingWithOptions:launchOptions];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"网络通过WIFI连接：%@",@(status));
                [self getInfo_application:application didFinishLaunchingWithOptions:launchOptions];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"网络通过无线连接：%@",@(status) );
                [self getInfo_application:application didFinishLaunchingWithOptions:launchOptions];
                break;
            }
            default:
                break;
        }
    }];
    [afNetworkReachabilityManager startMonitoring];  
}
- (void)getInfo_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BBIudgeViewController * iudgevc = [[BBIudgeViewController alloc]init];
    self.window.rootViewController = iudgevc;
    [self.window makeKeyAndVisible];
}
//- (void)applicationWillResignActive:(UIApplication *)application {
//}
//- (void)applicationDidEnterBackground:(UIApplication *)application {
//}
//- (void)applicationWillEnterForeground:(UIApplication *)application {
//}
//- (void)applicationDidBecomeActive:(UIApplication *)application {
//}
//- (void)applicationWillTerminate:(UIApplication *)application {
//}
//- (void)configureUMessageWithLaunchOptions:(NSDictionary *)launchOptions {
//    [UMConfigure initWithAppkey:UMAppKey channel:@"App Store"];
//    if (@available(iOS 10.0, *)) {
//        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
//    } else {
//    }
//    UMessageRegisterEntity* entity = [[UMessageRegisterEntity alloc] init];
//    entity.types= UMessageAuthorizationOptionBadge|UMessageAuthorizationOptionAlert;
//    if (@available(iOS 10.0, *)) {
//        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
//    } else {
//    }
//    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity completionHandler:^(BOOL granted, NSError* _Nullableerror) {
//        if(granted) {
//        }else{
//        }
//    }];
//}
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
//    [UMessage setAutoAlert:NO];
//    NSLog(@"j-------------------67676");
//}
//-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
//{
//    [UMessage setAutoAlert:NO];
//    [UMessage didReceiveRemoteNotification:userInfo];
//    NSLog(@"jforj-=-=-=-=-=-=wgopfjerpfgjr");
//}
//- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
//{
//    [UMessage registerDeviceToken:deviceToken];
//    NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken success");
//    NSLog(@"deviceToken————>>>%@",[[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<"withString: @""]
//                                    stringByReplacingOccurrencesOfString: @">"withString: @""]
//                                   stringByReplacingOccurrencesOfString: @" "withString: @""]);
//}
@end
