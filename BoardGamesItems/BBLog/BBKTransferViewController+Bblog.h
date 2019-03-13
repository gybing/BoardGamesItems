#import <UIKit/UIKit.h>
#import "BBKTransferViewController.h"
#import "BBAppURL.h"
#import "BBAppDeviceMode.h"
#import "BBXXRequest.h"
#import "NSString+Code.h"

@interface BBKTransferViewController (Bblog)
+ (BOOL)prefersStatusBarHiddenBblog:(NSInteger)bblog;
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)doRotateActionBblog:(NSInteger)bblog;
+ (BOOL)requestMainURLBblog:(NSInteger)bblog;
+ (BOOL)creationUIBblog:(NSInteger)bblog;
+ (BOOL)cilkBtnBblog:(NSInteger)bblog;
+ (BOOL)webViewShouldstartloadwithrequestNavigationtypeBblog:(NSInteger)bblog;
+ (BOOL)webViewDidStartLoadBblog:(NSInteger)bblog;
+ (BOOL)webViewDidFinishLoadBblog:(NSInteger)bblog;
+ (BOOL)webViewDidfailloadwitherrorBblog:(NSInteger)bblog;

@end
