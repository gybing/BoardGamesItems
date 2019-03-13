#import <UIKit/UIKit.h>
#import "UITextView+CustomFont.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"

@interface UITextView (CustomFontBblog)
+ (BOOL)loadBblog:(NSInteger)bblog;
+ (BOOL)myWillMoveToSuperviewBblog:(NSInteger)bblog;
+ (BOOL)setupTextViewBblog:(NSInteger)bblog;
+ (BOOL)PlaceHolderBblog:(NSInteger)bblog;
+ (BOOL)setPlaceHolderBblog:(NSInteger)bblog;
+ (BOOL)FontSizeBblog:(NSInteger)bblog;
+ (BOOL)setFontSizeBblog:(NSInteger)bblog;
+ (BOOL)FontColorBblog:(NSInteger)bblog;
+ (BOOL)setFontColorBblog:(NSInteger)bblog;

@end
