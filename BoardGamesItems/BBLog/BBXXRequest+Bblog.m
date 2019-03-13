#import "BBXXRequest+Bblog.h"
@implementation BBXXRequest (Bblog)
+ (BOOL)RequestManagerBblog:(NSInteger)bblog {
    return bblog % 38 == 0;
}
+ (BOOL)GetRequestDataWithUrlStrBodyProgressblockSuccessFailBblog:(NSInteger)bblog {
    return bblog % 29 == 0;
}
+ (BOOL)PostRequestDataWithUrlStrBodyProgressblockSuccessFailBblog:(NSInteger)bblog {
    return bblog % 48 == 0;
}
+ (BOOL)GETNetworkStatusBblog:(NSInteger)bblog {
    return bblog % 46 == 0;
}
+ (BOOL)PusNetworkStatusTypeBlockBblog:(NSInteger)bblog {
    return bblog % 25 == 0;
}

@end
