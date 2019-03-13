#import <UIKit/UIKit.h>
#import "SMPageStyle.h"
typedef enum : NSUInteger {
    SMTBDefaultEmptyType = 0,
} SMTBEmptyType;
@interface UITableView (JSCustom)
@property (assign, nonatomic) BOOL closeEmptyHandel;
@property(copy,nonatomic) NSString* emptyMsg;
@property(copy,nonatomic) NSString* emptyImage;
@property(assign,nonatomic) SMTBEmptyType emptyType;
-(void)showEmptyView;
-(void)hideEmptyView;
@end
