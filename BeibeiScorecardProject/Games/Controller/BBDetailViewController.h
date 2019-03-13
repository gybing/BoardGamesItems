#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BBDetailViewController : UIViewController
@property (nonatomic,strong)NSMutableArray<BBJSFastLoginModel*> * dataArr;
@property (nonatomic,copy) NSString * titleStr;
@property (nonatomic,copy) NSString * imageStr;
@end
NS_ASSUME_NONNULL_END
