#import <Foundation/Foundation.h>
#define APP_API @"/index.php?c=api&a=index"
#define app_id  @"6fffd73ca1dc3f4ef649adf6760f2692"
#define app_secret @"8346f3f658ff710ebdf10247b77b1b30"
#define market_secret @"eff2981d41f7c5cf8e217a0f86ba6cec"
#define APP_TYPE_WelcomeHome @"WelcomeHome"
#define APP_TYPE_registered  @"registered"
#define APP_TYPE_CheckLogin  @"CheckLogin"
#define APP_TYPE_GetLotteryData  @"GetLotteryData"
#define APP_TYPE_GetLotteryDetailData  @"GetLotteryDetailData"
@interface BBAppURL : NSObject
+ (instancetype)Manager;
@property (nonatomic,strong) const NSArray * hostArrs;
@property (nonatomic,strong) const NSString * HttpHost;
@end
