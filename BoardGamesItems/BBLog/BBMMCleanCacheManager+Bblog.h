#import <Foundation/Foundation.h>
#import "BBMMCleanCacheManager.h"
#import <WebKit/WebKit.h>
#import "YYCache.h"
#import "SDImageCache.h"

@interface BBMMCleanCacheManager (Bblog)
+ (BOOL)CachesclearBblog:(NSInteger)bblog;
+ (BOOL)CalculatePictureCachesBblog:(NSInteger)bblog;
+ (BOOL)clearPictureCachesBblog:(NSInteger)bblog;
+ (BOOL)clearWkWebViewCacheBblog:(NSInteger)bblog;
+ (BOOL)clearHPMainCacheBblog:(NSInteger)bblog;
+ (BOOL)CalculateWebViewCachesBblog:(NSInteger)bblog;
+ (BOOL)clearWebViewCachesBblog:(NSInteger)bblog;
+ (BOOL)CalculateAllCachesBblog:(NSInteger)bblog;
+ (BOOL)clearAllCachesBblog:(NSInteger)bblog;

@end
