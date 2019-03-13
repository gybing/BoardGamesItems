#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, JSCommonAlertViewTextAlignment) {
    TextAlignmentLeft,
    TextAlignmentCenter,
    TextAlignmentRight
};
typedef NS_ENUM(NSInteger, JSCommonAlertViewButtonStyle) {
    ButtonLandscapeStyle,
    ButtonVerticalStyle
};
typedef void(^JSAlertViewBlock)(void);
@interface BBJSCommonAlertView : UIView
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) NSArray <UIButton *>*buttonArray;
@property (nonatomic, strong, readonly) UIView *bgView;
@property (nonatomic, strong) NSMutableArray <UILabel *>*tempLabelArray;
@property (nonatomic, strong) NSMutableArray <UILabel *>*leftLabelArray;
@property (nonatomic, strong) NSMutableArray <UILabel *>*rightLabelArray;
- (instancetype)initWithTitle:(NSString *)title textArray:(NSArray <NSString *>*)textArray textAlignment:(JSCommonAlertViewTextAlignment)textAlignment buttonStyle:(JSCommonAlertViewButtonStyle)buttonStyle;
- (instancetype)initWithTitle:(NSString *)title leftTextArray:(NSArray <NSString *>*)leftTextArray rightTextArray:(NSArray <NSString *>*)rightTextArray buttonStyle:(JSCommonAlertViewButtonStyle)buttonStyle;
- (void)addAction:(NSString *)buttonTitle finishBlock:(JSAlertViewBlock)finishBlock;
- (void)showAlertView;
- (void)showAlertView:(NSString *)buttonTitle sureBlock:(JSAlertViewBlock)sureBlock;
- (void)showAlertView:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle cancelBlock:(JSAlertViewBlock)cancelBlock sureBlock:(JSAlertViewBlock)sureBlock;
@end
