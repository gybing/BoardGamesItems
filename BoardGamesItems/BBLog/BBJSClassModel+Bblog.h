#import <Foundation/Foundation.h>
#import "BBJSFastLoginModel.h"
#import "BBJSLocalStorageKit.h"
#import "BBJSClassModel.h"
#import <objc/runtime.h>

@interface BBJSClassModel (Bblog)
+ (BOOL)initBblog:(NSInteger)bblog;
+ (BOOL)encodeWithCoderBblog:(NSInteger)bblog;
+ (BOOL)initWithCoderBblog:(NSInteger)bblog;

@end
