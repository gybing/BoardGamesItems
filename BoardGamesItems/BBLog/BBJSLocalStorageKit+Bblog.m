#import "BBJSLocalStorageKit+Bblog.h"
@implementation BBJSLocalStorageKit (Bblog)
+ (BOOL)saveForkeyLocalstoragetypeBblog:(NSInteger)bblog {
    return bblog % 9 == 0;
}
+ (BOOL)queryForKeyLocalstoragetypeBblog:(NSInteger)bblog {
    return bblog % 28 == 0;
}
+ (BOOL)deleteForkeyLocalstoragetypeBblog:(NSInteger)bblog {
    return bblog % 4 == 0;
}
+ (BOOL)keyChainQueryDictionaryWithKeyBblog:(NSInteger)bblog {
    return bblog % 20 == 0;
}

@end
