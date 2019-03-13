#import "NSString+Code.h"
@implementation NSString (Code)
- (BOOL)isStringCodeWithString;
{
    NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL  result = [pred evaluateWithObject:self];
    return result;
}
- (NSObject *)codeStringToDictionary
{
    NSData * data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (data != nil) {
        return  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    }
    return @{};
}
@end
