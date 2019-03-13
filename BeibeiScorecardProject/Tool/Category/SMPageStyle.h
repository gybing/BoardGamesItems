#ifndef SMPageStyle_h
#define SMPageStyle_h
#define SMGlobalFontName @"Microsoft YaHei"
#define SMFontBigButton 15
#define SMFontBig 13
#define SMFontNormal 12
#define SMFontSmall 10
#define SMColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define SMMainContent SMColorFromRGB(0x333333)
#define SMDeclaratives SMColorFromRGB(0x808080)
#define SMPriceStatus SMColorFromRGB(0xeb5300)
#define SMPlaceHolder SMColorFromRGB(0Xb3b3b3)
#define SMConfirmButton SMColorFromRGB(0x1592db)
#define SMBackgroundColor SMColorFromRGB(0xefeff4)
#define SMSeparator SMColorFromRGB(0xe5e5e5)
#define SMMainColor SMColorFromRGB(0xeb5300)
static const char * _closeEmptyHandel = "sm_closeEmptyHandel";
static const char * _emptyMsg = "sm_emptyMsg";
static const char * _emptyImage = "sm_emptyImage";
static const char * _emptyType = "sm_emptyType";
#define EmptyMsgViewTag 8888
#define EmptyMsgTag 8889
#define EmptyIconTag 8890
#define isEmpytLabelOrField(str) str==nil?@"":[str isEqual:[NSNull null]]?@"":str
#define isEmpytNumberStr(str) str==nil?@"0":[str isEqual:[NSNull null]]?@"0":str
#define WS(wSelf)          __weak typeof(self) wSelf = self
#define SS(sSelf)          __strong typeof(wSelf) sSelf = wSelf
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KEY_WINDOW  [UIApplication sharedApplication].delegate.window
#define JS_StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define JS_NavBarHeight 44.0
#define JS_NavigationHeight (JS_StatusBarHeight + JS_NavBarHeight)
#endif 
