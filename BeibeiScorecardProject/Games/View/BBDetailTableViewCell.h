#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BBDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
+ (BBDetailTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
