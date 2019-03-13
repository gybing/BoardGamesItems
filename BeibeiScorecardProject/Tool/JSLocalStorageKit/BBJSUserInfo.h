#import <Foundation/Foundation.h>
#import "BBJSLocalStorageKit.h"
#import <UIKit/UIKit.h>
@class BBJSFastLoginModel;
@class BBJSClassModel;
@interface BBJSUserInfo : NSObject
+(BBJSUserInfo *)shareManager;
@property (strong, nonatomic) NSMutableArray <BBJSClassModel *> * gamesArray;
@property (copy, nonatomic) NSString *token;
@property (copy,nonatomic) NSString* pushDeviceToken;
@property (copy, nonatomic) NSString *nickName;
@property (copy, nonatomic) NSString *signature;
@property (copy , nonatomic) UIImage * header_image;
@end
