#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BBAddNumberViewController : UIViewController
typedef void (^ReturnAddBlock) (BBJSFastLoginModel * addModel);
@property(nonatomic, copy) ReturnAddBlock returnAddBlock;
@end
NS_ASSUME_NONNULL_END
