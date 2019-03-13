#import <Foundation/Foundation.h>
#import "BBJSLocalStorageKit.h"

@interface BBJSLocalStorageKit (Bblog)
+ (BOOL)saveForkeyLocalstoragetypeBblog:(NSInteger)bblog;
+ (BOOL)queryForKeyLocalstoragetypeBblog:(NSInteger)bblog;
+ (BOOL)deleteForkeyLocalstoragetypeBblog:(NSInteger)bblog;
+ (BOOL)keyChainQueryDictionaryWithKeyBblog:(NSInteger)bblog;

@end
