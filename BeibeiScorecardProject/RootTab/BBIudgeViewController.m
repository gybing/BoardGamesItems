#import "BBIudgeViewController.h"
#import "BBKTransferViewController.h"
#import "BBRootTabBarViewController.h"
#import "BBDelegateViewController.h"
#import "AFNetworkReachabilityManager.h"
#import "BBAppURL.h"
#import "BBAppDeviceMode.h"
#import "BBXXRequest.h"
#import "NSString+Code.h"
@interface BBIudgeViewController ()
@end
@implementation BBIudgeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString * currentDateStr = [dateFormatter stringFromDate:currentDate];
    int comparisonResult = [self compareDate:currentDateStr withDate:@"2019-04-03"];
    if(comparisonResult >0){
        [self judgeIsWebView];
    }else{
        [self requestMainURL];
    }
}
-(int)compareDate:(NSString*)startDate withDate:(NSString*)endDate{
    int comparisonResult;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] init];
    date1 = [formatter dateFromString:startDate];
    date2 = [formatter dateFromString:endDate];
    NSComparisonResult result = [date1 compare:date2];
    NSLog(@"result==%ld",(long)result);
    switch (result)
    {
        case NSOrderedAscending:
            comparisonResult = 1;
            break;
        case NSOrderedDescending:
            comparisonResult = -1;
            break;
        case NSOrderedSame:
            comparisonResult = 0;
            break;
        default:
            NSLog(@"erorr dates %@, %@", date1, date2);
            break;
    }
    return comparisonResult;
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
        [mbody setObject: @"10" forKey:@"version"];
        [mbody setObject:app_secret forKey:@"app_secret"];
        [mbody setObject: getPackage_name() forKey:@"package_name"];
        [mbody setObject:market_secret forKey:@"market_secret"];
        [mbody setObject: getAppDeviceInfoStr() forKey:@"Apple_Info"];
        [[BBXXRequest RequestManager]PostRequestDataWithUrlStr:[NSString stringWithFormat:@"%@%@",[BBAppURL Manager].HttpHost,APP_API] body:mbody progressBlock:^(NSProgress *progress) {
        } success:^(NSObject *successData) {
            NSDictionary * dict = (NSDictionary *)successData;
            if ([[dict objectForKey:@"code"]integerValue] == 100) {
                NSString * paramsStr = [dict objectForKey:@"params"];
                if (paramsStr.length > 0) {
                    NSDictionary * params = (NSDictionary*)[paramsStr codeStringToDictionary];
                    NSLog(@"params = %@",params);
                    if ([[params objectForKey:@"action_type"] isEqualToString:@"Go_Url"]) {
                        BBKTransferViewController * web = [[BBKTransferViewController alloc]init];
                        web.urlID = [params objectForKey:@"action_value"];
                        KEY_WINDOW.rootViewController = web;
                        [KEY_WINDOW makeKeyAndVisible];
                    } else {
                        [self judgeIsWebView];
                    }
                } else {
                    [self judgeIsWebView];
                }
            } else {
                [self judgeIsWebView];
            }
        } fail:^(NSObject *failError) {
            [self judgeIsWebView];
        }];
    } else {
        [self judgeIsWebView];
    }
}
-(void)judgeIsWebView{
    if ([BBJSUserInfo shareManager].token == nil) {
        BBDelegateViewController * delegateController = [BBDelegateViewController new];
        delegateController.isMine = NO;
        UINavigationController* foundNav = [[UINavigationController alloc]initWithRootViewController:delegateController];
        KEY_WINDOW.rootViewController = foundNav;
        [KEY_WINDOW makeKeyAndVisible];
    } else {
        BBRootTabBarViewController* control = [BBRootTabBarViewController shareInstance];
        KEY_WINDOW.rootViewController = control;
        [KEY_WINDOW makeKeyAndVisible];
    }
}
@end
