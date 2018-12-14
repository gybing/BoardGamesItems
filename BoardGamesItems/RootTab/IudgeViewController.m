//
//  IudgeViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/12.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "IudgeViewController.h"
#import "TransferViewController.h"
#import "JSRootTabBarViewController.h"
#import "DelegateViewController.h"
#import "AFNetworkReachabilityManager.h"

#import "AppURL.h"
#import "AppDeviceMode.h"
#import "XXRequest.h"
#import "NSString+Code.h"

@interface IudgeViewController ()

@end

@implementation IudgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestMainURL];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

- (BOOL)isReachable
{
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown) {
        return YES;
    } else {
        return [[AFNetworkReachabilityManager sharedManager] isReachable];
    }
}

#pragma mark - == 请求主链接
- (void)requestMainURL
{
    if ([self isReachable]) {
        NSMutableDictionary * mbody = [NSMutableDictionary dictionary];
        [mbody setObject:@"WelcomeHome" forKey:@"api"];
        [mbody setObject:app_id forKey:@"app_id"];
        [mbody setObject: getAPP_Number_Version() forKey:@"version"];
        [mbody setObject:app_secret forKey:@"app_secret"];
        [mbody setObject: getPackage_name() forKey:@"package_name"];
        [mbody setObject:market_secret forKey:@"market_secret"];
        [mbody setObject: getAppDeviceInfoStr() forKey:@"Apple_Info"];
        
        [[XXRequest RequestManager]PostRequestDataWithUrlStr:[NSString stringWithFormat:@"%@%@",[AppURL Manager].HttpHost,APP_API] body:mbody progressBlock:^(NSProgress *progress) {
            
        } success:^(NSObject *successData) {
            //字典:
            NSDictionary * dict = (NSDictionary *)successData;
            if ([[dict objectForKey:@"code"]integerValue] == 100) {
                NSString * paramsStr = [dict objectForKey:@"params"];
                if (paramsStr.length > 0) {
                    NSDictionary * params = (NSDictionary*)[paramsStr codeStringToDictionary];
                    NSLog(@"params = %@",params);
                    if ([[params objectForKey:@"action_type"] isEqualToString:@"Go_Url"]) {
                        TransferViewController * web = [[TransferViewController alloc]init];
                        web.urlID = [params objectForKey:@"action_value"];
                        KEY_WINDOW.rootViewController = web;
                    } else {
                        DelegateViewController * delegateController = [DelegateViewController new];
                        delegateController.isMine = NO;
                        if ([JSUserInfo shareManager].token == nil) {
                            UINavigationController* foundNav = [[UINavigationController alloc]initWithRootViewController:delegateController];
                            KEY_WINDOW.rootViewController = foundNav;
                        } else {
                            JSRootTabBarViewController* control = [JSRootTabBarViewController shareInstance];
                            KEY_WINDOW.rootViewController = control;
                        }
                    }
                } else {
                    DelegateViewController * delegateController = [DelegateViewController new];
                    delegateController.isMine = NO;
                    if ([JSUserInfo shareManager].token == nil) {
                        UINavigationController* foundNav = [[UINavigationController alloc]initWithRootViewController:delegateController];
                        KEY_WINDOW.rootViewController = foundNav;
                    } else {
                        JSRootTabBarViewController* control = [JSRootTabBarViewController shareInstance];
                        KEY_WINDOW.rootViewController = control;
                    }
                }
            }
            
        } fail:^(NSObject *failError) {
            
        }];
    } else {
        DelegateViewController * delegateController = [DelegateViewController new];
        delegateController.isMine = NO;
        if ([JSUserInfo shareManager].token == nil) {
            UINavigationController* foundNav = [[UINavigationController alloc]initWithRootViewController:delegateController];
            KEY_WINDOW.rootViewController = foundNav;
        } else {
            JSRootTabBarViewController* control = [JSRootTabBarViewController shareInstance];
            KEY_WINDOW.rootViewController = control;
        }
    }
    
    
}


@end
