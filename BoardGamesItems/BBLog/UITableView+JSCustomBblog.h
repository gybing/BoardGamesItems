#import <UIKit/UIKit.h>
#import "SMPageStyle.h"
#import "UITableView+JSCustom.h"
#import <objc/runtime.h>
#import "Masonry.h"
#import "ReactiveObjC.h"
#import "SMPageStyle.h"

@interface UITableView (JSCustomBblog)
+ (BOOL)loadBblog:(NSInteger)bblog;
+ (BOOL)app_awakeFromNibBblog:(NSInteger)bblog;
+ (BOOL)showEmptyViewBblog:(NSInteger)bblog;
+ (BOOL)hideEmptyViewBblog:(NSInteger)bblog;
+ (BOOL)checkEmptyBblog:(NSInteger)bblog;
+ (BOOL)isEmptyBblog:(NSInteger)bblog;
+ (BOOL)prepareEmptyViewBblog:(NSInteger)bblog;
+ (BOOL)setEmptyViewStatusBblog:(NSInteger)bblog;
+ (BOOL)setCloseEmptyHandelBblog:(NSInteger)bblog;
+ (BOOL)closeEmptyHandelBblog:(NSInteger)bblog;
+ (BOOL)setEmptyMsgBblog:(NSInteger)bblog;
+ (BOOL)emptyMsgBblog:(NSInteger)bblog;
+ (BOOL)setEmptyImageBblog:(NSInteger)bblog;
+ (BOOL)emptyImageBblog:(NSInteger)bblog;
+ (BOOL)setEmptyTypeBblog:(NSInteger)bblog;
+ (BOOL)emptyTypeBblog:(NSInteger)bblog;

@end
