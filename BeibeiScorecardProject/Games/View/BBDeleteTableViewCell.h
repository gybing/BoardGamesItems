#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BBDeleteTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;
+ (BBDeleteTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
