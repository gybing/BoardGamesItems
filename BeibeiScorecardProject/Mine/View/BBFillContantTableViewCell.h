#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BBFillContantTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
+ (BBFillContantTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
