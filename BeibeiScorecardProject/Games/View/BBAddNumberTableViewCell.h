#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BBAddNumberTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *noteField;
+ (BBAddNumberTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
