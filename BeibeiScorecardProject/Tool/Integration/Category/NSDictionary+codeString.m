#import "NSDictionary+codeString.h"
@implementation NSDictionary (codeString)
- (NSString *)codeDictionaryToString
{
    NSError * parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    if (jsonData != nil) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return @"";
}
@end
