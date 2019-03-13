#define isEmpytLabelOrField(str) str==nil?@"":[str isEqual:[NSNull null]]?@"":str
#import <UIKit/UIKit.h>
#import "DefineHeader.h"
typedef NS_ENUM(NSInteger, CurrentUseTool) {
    CurrentUseAddress = 66,
    CurrentUseSingle,
    CurrentUseMonthAndDay
};
@interface BBJSSelectViewTool : UIView<NSXMLParserDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
typedef void(^CityBlock)(NSString * cityStr,NSString * areStr);
typedef void(^CityCodeBlock)(NSString * cityStr,NSString * provinceCode,NSString * cityCode,NSString * areCode);
typedef void(^DateBlock)(NSString * monthStr,NSString * yearsStr);
@property (nonatomic, strong)UIView * bgView;
@property (nonatomic, strong)UITapGestureRecognizer * tap;
@property (nonatomic, strong)UIView * topView;
@property (nonatomic, strong) UIButton * leftBtn;
@property (nonatomic, strong) UIButton * rightBtn;
@property (nonatomic, strong)UIView * bottomView;
@property (nonatomic, strong)UIPickerView * pickerView;
@property (nonatomic, strong) UIView * lineView;
@property (nonatomic, strong)CityBlock myBlock;
@property (nonatomic, strong)CityCodeBlock codeBlock;
@property (nonatomic, strong)DateBlock dateBlock;
@property (nonatomic, assign) CurrentUseTool selectType;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,copy) void(^callBackBlock)(id obj,NSInteger currentIndex);
@property (nonatomic,copy) void(^cancelBlock)(void);
+ (BBJSSelectViewTool *)sharedManager;
- (void)getCityFromPickerView:(CityBlock)block;
- (void)getCityAndCodeFromPickerView:(CityCodeBlock)block;
-(void)inpour:(NSMutableArray *)dataArray currentIndexd:(NSInteger)currentIndex confirmBlock:(void(^)(id obj,NSInteger currentIndex))confirmBlock cancelBlock:(void(^)(void))cancelBlock;
- (void)getdateFromPickerView:(DateBlock)block;
@end
