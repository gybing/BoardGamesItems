#import <Foundation/Foundation.h>
#import "BBJSFastLoginModel.h"
#import "BBJSLocalStorageKit.h"
@interface BBJSClassModel : NSObject
@property (strong, nonatomic) NSMutableArray <BBJSFastLoginModel *> * userInfoArray;
@property(copy,nonatomic) NSString * class_name;
@property(copy,nonatomic) NSString * class_describe;
@property(copy,nonatomic) NSString * class_isSelect;
@property(copy,nonatomic) NSString * class_image;
@property(strong,nonatomic) NSMutableArray<BBJSFastLoginModel*> * numberArr;
- (instancetype)init;
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
@end
