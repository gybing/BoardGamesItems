#ifndef DefineHeader_h
#define DefineHeader_h
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define FontTextNormal    [UIFont systemFontOfSize:15]
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define JSAddressXML [NSBundle bundleWithURL:[[NSBundle bundleWithIdentifier:@"org.cocoapods.JSKit"] URLForResource:@"districts_bak" withExtension:@"xml"]]
#define BundleForClassName(className) [NSBundle bundleForClass:NSClassFromString(className)]
#endif 
