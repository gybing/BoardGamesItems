#import <Foundation/Foundation.h>
#import "BBXXRequest.h"
#import <AFNetworking.h>

@interface BBXXRequest (Bblog)
+ (BOOL)RequestManagerBblog:(NSInteger)bblog;
+ (BOOL)GetRequestDataWithUrlStrBodyProgressblockSuccessFailBblog:(NSInteger)bblog;
+ (BOOL)PostRequestDataWithUrlStrBodyProgressblockSuccessFailBblog:(NSInteger)bblog;
+ (BOOL)GETNetworkStatusBblog:(NSInteger)bblog;
+ (BOOL)PusNetworkStatusTypeBlockBblog:(NSInteger)bblog;

@end
