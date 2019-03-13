#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BBDeleteViewController : UIViewController
@property (nonatomic,strong) BBJSFastLoginModel * model;
typedef void (^ReturnDeleteBlock) (void);
@property(nonatomic, copy) ReturnDeleteBlock returnDeleteBlock;
@end
NS_ASSUME_NONNULL_END
