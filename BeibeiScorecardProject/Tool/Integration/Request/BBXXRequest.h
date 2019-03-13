#import <Foundation/Foundation.h>
typedef void(^successBlock)(NSObject * successData);
typedef void(^failBlock)(NSObject * failError);
typedef void(^progressBlock)(NSProgress * progress);
typedef enum : NSUInteger {
    NetworkStatusType2G = 1,
    NetworkStatusType3G = 2,
    NetworkStatusType4G = 3,
    NetworkStatusTypeLTE = 4,
    NetworkStatusTypeWIFI = 5,
    NetworkStatusTypePhone = 6,
    NetworkStatusTypeNotReachable = 0,
} NetworkStatusType;
typedef void(^statusBlock)(NetworkStatusType type);
@interface BBXXRequest : NSObject
+ (instancetype)RequestManager;
- (void)GetRequestDataWithUrlStr: (NSString *)urlStr
                            body: (NSObject *)body
                   progressBlock: (progressBlock)progressblock
                         success: (successBlock)successblock
                            fail: (failBlock)failblock;
- (void)PostRequestDataWithUrlStr: (NSString *)urlStr
                             body: (NSObject *)body
                    progressBlock: (progressBlock)progressblock
                          success: (successBlock)successblock
                             fail: (failBlock)failblock;
+(NetworkStatusType )GETNetworkStatus;
- (void)PusNetworkStatusTypeBlock: (statusBlock)block;
@end
