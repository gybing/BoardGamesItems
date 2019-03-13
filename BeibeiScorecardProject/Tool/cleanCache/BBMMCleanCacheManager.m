#import "BBMMCleanCacheManager.h"
#import <WebKit/WebKit.h>
#import "YYCache.h"
#import "SDImageCache.h"
@implementation BBMMCleanCacheManager
+ (BBMMCleanCacheManager *)Cachesclear{
    static BBMMCleanCacheManager * manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager =  [[BBMMCleanCacheManager alloc]init];
    });
    return manager;
}
-(long long)CalculatePictureCaches{
    return [[SDImageCache sharedImageCache] getSize];
}
-(void)clearPictureCaches{
    [[SDImageCache sharedImageCache] clearMemory];
}
- (void)clearWkWebViewCache{
    if (@available(iOS 9.0, *)) {
        NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        }];
    }
}
- (void)clearHPMainCache
{
}
-(long long)CalculateWebViewCaches{
    return 0;
}
-(void)clearWebViewCaches{
}
-(long long)CalculateAllCaches{
    return [[BBMMCleanCacheManager Cachesclear] CalculatePictureCaches]+[[BBMMCleanCacheManager Cachesclear] CalculateWebViewCaches];
}
-(void)clearAllCaches{
    [[BBMMCleanCacheManager Cachesclear] clearPictureCaches];
    [[BBMMCleanCacheManager Cachesclear] clearWkWebViewCache];
}
@end
