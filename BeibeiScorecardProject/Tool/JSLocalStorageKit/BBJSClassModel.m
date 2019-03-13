#define ClassUserNameArray @"ClassUserNameArray"
#define Class_name @"Class_name"
#define Class_color @"Class_color"
#import "BBJSClassModel.h"
#import <objc/runtime.h>
@implementation BBJSClassModel
- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}
#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder{
    Class c = self.class;
    while (c && c!=[NSObject class]) {
        unsigned int propertyCount;
        objc_property_t * propertys = class_copyPropertyList([c class], &propertyCount);
        for (int i = 0; i < propertyCount; i++) {
            objc_property_t property = propertys[i];
            const char * propertyName = property_getName(property);
            NSString * name = [NSString stringWithUTF8String:propertyName];
            [aCoder encodeObject:[self valueForKey:name] forKey:name];
        }
        free(propertys);
        c = [c superclass];
    }
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        Class c = self.class;
        while (c && c!=[NSObject class]) {
            unsigned int propertyCount;
            objc_property_t * propertys = class_copyPropertyList([c class], &propertyCount);
            for (int i = 0; i < propertyCount; i++) {
                objc_property_t property = propertys[i];
                const char * propertyName = property_getName(property);
                NSString * name = [NSString stringWithUTF8String:propertyName];
                id tmp = [aDecoder decodeObjectForKey:name];
                if (tmp != nil) {
                    [self setValue:[aDecoder decodeObjectForKey:name] forKey:name];
                }
            }
            free(propertys);
            c = [c superclass];
        }
    }
    return self;
}
#pragma mark - save & queue
#pragma mark - getter & setter
@end
