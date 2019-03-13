#import <Foundation/Foundation.h>
@interface BBMMCleanCacheManager : NSObject
+ (BBMMCleanCacheManager *)Cachesclear;
-(long long)CalculatePictureCaches;
-(void)clearPictureCaches;
-(long long)CalculateWebViewCaches;
-(void)clearWebViewCaches;
-(long long)CalculateAllCaches;
-(void)clearAllCaches;
@end
