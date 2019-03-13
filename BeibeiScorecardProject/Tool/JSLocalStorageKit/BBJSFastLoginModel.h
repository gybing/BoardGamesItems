#import <Foundation/Foundation.h>
@interface BBJSFastLoginModel : NSObject<NSCoding>
@property(copy,nonatomic) NSString * class_image;
@property(copy,nonatomic) NSString* class_year;
@property(copy,nonatomic) NSString* class_day;
@property(copy,nonatomic) NSString* class_hour;
@property(copy,nonatomic) NSString* class_week;
@property(copy,nonatomic) NSString* class_number;
@property(copy,nonatomic) NSString* class_name;
@property(copy,nonatomic) NSString* class_note;
@property(copy,nonatomic) NSString* class_isAdd;
- (instancetype)init;
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
@end
