#ifndef AppMacro_h
#define AppMacro_h
#pragma mark - == 常用的宏
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH_RATIO(size)  SCREEN_WIDTH/414 * size
#define SCREEN_HEIGHT_RATIO(size)  SCREEN_HEIGHT/736 * size
#define  iPhoneX ((SCREEN_WIDTH == 375.f && SCREEN_HEIGHT == 812.f) ||(SCREEN_WIDTH == 812.f && SCREEN_HEIGHT == 375.f) ? YES : NO)
#define  MC_StatusBarHeight      (iPhoneX ? 44.f : 20.f)
#define  MC_TabbarHeight         (iPhoneX ? (49.f+34.f) : 49.f)
#define  MC_TabbarSafeBottomMargin         (iPhoneX ? 34.f : 0.f)
#define  MC_NavHeight  (iPhoneX ? 88.f : 64.f)
#define SAFE_WIDTH [UIScreen mainScreen].bounds.size.width
#define SAFE_WIDTH_HORI (SCREEN_WIDTH - MC_StatusBarHeight - MC_TabbarSafeBottomMargin)
#define SAFE_HEIGHT (SCREEN_HEIGHT - MC_StatusBarHeight - MC_TabbarSafeBottomMargin)
#define SAFE_HEIGHT_HORI (SCREEN_HEIGHT - MC_TabbarSafeBottomMargin)
#define ColorWithRGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define ColorWith1Hex(Hex,A) [UIColor colorWithRed:((Hex & 0xFF0000)>> 16)/255.0 green:((Hex & 0xFF00)>> 8)/255.0 blue:(Hex & 0xFF)/255.0 alpha:A]
#define WeakBlockSelf(type)  __weak  __block typeof(type) weakBlockType = type;
#define WeakSelf(type)  __weak  typeof(type) weakType = type;
#define  URLWithStr(str) [NSURL URLWithString:str]
#define FontWithSize(size)  [UIFont systemFontOfSize:size]
#define BoldFontWithSize(size) [UIFont boldSystemFontOfSize:size]
#define ImageWithName(name) [UIImage imageNamed:name]
#define  AppCGRectMake(x,y,width,height) CGRectMake(x, y,width, height)
#pragma mark - == APP主体
#define NAV_COLOR ColorWith1Hex(0xFF623C,1.0)
#define Center_COLOR ColorWith1Hex(0xFF623C,1.0)
#define CenterNor_COLOR ColorWith1Hex(0x666666 ,1.0)
#pragma mark - == 系统相关
#define package_name    [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]
#define APP_version     [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define Device_Name     [[UIDevice currentDevice] name]
#define Device_systemVersion    [[UIDevice currentDevice] systemVersion]
#define Device_UUID [[UIDevice currentDevice] identifierForVendor]
#define IOS_VERSION ［[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ［UIDevice currentDevice] systemVersion]
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#endif 
