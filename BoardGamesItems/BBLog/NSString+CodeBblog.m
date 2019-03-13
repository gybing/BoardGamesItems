#import "NSString+CodeBblog.h"
@implementation NSString (CodeBblog)
+ (BOOL)isStringCodeWithStringBblog:(NSInteger)bblog {
    return bblog % 9 == 0;
}
+ (BOOL)codeStringToDictionaryBblog:(NSInteger)bblog {
    return bblog % 22 == 0;
}

@end
