#import "BBXXRequest.h"
#import <AFNetworking.h>
@implementation BBXXRequest
+ (instancetype)RequestManager
{
    return [[BBXXRequest alloc]init];
}
- (void)GetRequestDataWithUrlStr:(NSString *)urlStr
                            body:(NSObject *)body
                   progressBlock:(progressBlock)progressblock
                         success:(successBlock)successblock
                            fail:(failBlock)failblock
{
    NSString * Rurlstr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json" ,@"text/javascript", nil];
    [manger GET:Rurlstr parameters:body progress:^(NSProgress * _Nonnull downloadProgress) {
        progressblock(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * dict = (NSDictionary *)responseObject;
        NSString * paramsStr = [dict objectForKey:@"params"];
        NSDictionary * json  = @{};
        if (paramsStr.length > 0)
        {
            NSData * data = [paramsStr dataUsingEncoding:NSUTF8StringEncoding];
            json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        }
        successblock((NSObject *)json);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failblock(error);
    }];
}
- (void)PostRequestDataWithUrlStr:(NSString *)urlStr
                             body:(NSObject *)body
                    progressBlock:(progressBlock)progressblock
                          success:(successBlock)successblock
                             fail:(failBlock)failblock
{
    NSString * Rurlstr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json" ,@"text/javascript", nil];
    [manger.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [manger POST:Rurlstr parameters:body progress:^(NSProgress * _Nonnull downloadProgress) {
        progressblock(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successblock((NSObject *)responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failblock(error);
    }];
}
#pragma mark - === 网络状态：
+ (NetworkStatusType )GETNetworkStatus
{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    NSString *stateString = @" ";
    NetworkStatusType statusType = 0;
    switch (type) {
        case 0:
            stateString = @"notReachable";
            statusType = NetworkStatusTypeNotReachable;
            break;
        case 1:
            stateString = @"2G";
            statusType = NetworkStatusType2G;
            break;
        case 2:
            stateString = @"3G";
            statusType = NetworkStatusType3G;
            break;
        case 3:
            stateString = @"4G";
            statusType = NetworkStatusType4G;
            break;
        case 4:
            stateString = @"LTE";
            statusType = NetworkStatusTypeLTE;
            break;
        case 5:
            stateString = @"wifi";
            statusType = NetworkStatusTypeWIFI;
            break;
        default:
            break;
    }
    return statusType;
}
- (void)PusNetworkStatusTypeBlock: (statusBlock)block
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NetworkStatusType statusType = 0;
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                statusType = NetworkStatusTypeNotReachable;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                statusType = NetworkStatusTypeNotReachable;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                statusType = NetworkStatusTypePhone;
                NSLog(@"手机蜂窝网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                statusType = NetworkStatusTypeWIFI;
                NSLog(@"WIFI");
                break;
        }
        block(statusType);
    }];
    [manager startMonitoring];
}
@end
