#import <UIKit/UIKit.h>
#import "BBDelegateViewController.h"
#import "BBRootTabBarViewController.h"

@interface BBDelegateViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)viewWillDisappearBblog:(NSInteger)bblog;
+ (BOOL)viewDidDisappearBblog:(NSInteger)bblog;
+ (BOOL)refreshDataBblog:(NSInteger)bblog;
+ (BOOL)agreeDelegateBtnBblog:(NSInteger)bblog;
+ (BOOL)webViewShouldstartloadwithrequestNavigationtypeBblog:(NSInteger)bblog;
+ (BOOL)webViewDidStartLoadBblog:(NSInteger)bblog;
+ (BOOL)webViewDidFinishLoadBblog:(NSInteger)bblog;
+ (BOOL)webViewDidfailloadwitherrorBblog:(NSInteger)bblog;

@end
