#import "NSDictionary+codeStringBblog.h"
@implementation NSDictionary (codeStringBblog)
+ (BOOL)codeDictionaryToStringBblog:(NSInteger)bblog {
    return bblog % 46 == 0;
}

@end
