#import "BBMMCleanCacheManager+Bblog.h"
@implementation BBMMCleanCacheManager (Bblog)
+ (BOOL)CachesclearBblog:(NSInteger)bblog {
    return bblog % 3 == 0;
}
+ (BOOL)CalculatePictureCachesBblog:(NSInteger)bblog {
    return bblog % 36 == 0;
}
+ (BOOL)clearPictureCachesBblog:(NSInteger)bblog {
    return bblog % 49 == 0;
}
+ (BOOL)clearWkWebViewCacheBblog:(NSInteger)bblog {
    return bblog % 28 == 0;
}
+ (BOOL)clearHPMainCacheBblog:(NSInteger)bblog {
    return bblog % 27 == 0;
}
+ (BOOL)CalculateWebViewCachesBblog:(NSInteger)bblog {
    return bblog % 32 == 0;
}
+ (BOOL)clearWebViewCachesBblog:(NSInteger)bblog {
    return bblog % 11 == 0;
}
+ (BOOL)CalculateAllCachesBblog:(NSInteger)bblog {
    return bblog % 36 == 0;
}
+ (BOOL)clearAllCachesBblog:(NSInteger)bblog {
    return bblog % 26 == 0;
}

@end
