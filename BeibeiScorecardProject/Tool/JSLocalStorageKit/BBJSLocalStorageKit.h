#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,JSLocalStorageType){
    JSLocalStorageTypeUserDefault,
    JSLocalStorageTypeKeyChain,
};
@interface BBJSLocalStorageKit : NSObject
+ (void)save:(id)data forKey:(NSString *)key localStorageType:(JSLocalStorageType)type;
+ (id)queryForKey:(NSString *)key localStorageType:(JSLocalStorageType)type;
+ (void)deleteForkey:(NSString *)key localStorageType:(JSLocalStorageType)type;
@end
