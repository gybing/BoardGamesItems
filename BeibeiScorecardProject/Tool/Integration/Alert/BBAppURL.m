#import "BBAppURL.h"
static BBAppURL * appUrl = nil;
@implementation BBAppURL
+ (instancetype)Manager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (appUrl == nil) {
            appUrl = [[BBAppURL alloc]init];
        }
    });
    return appUrl;
}
@end
