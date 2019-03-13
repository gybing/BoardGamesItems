#import "BBAddGameTableViewCell.h"
@implementation BBAddGameTableViewCell
+ (BBAddGameTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"BBAddGameTableViewCell";
    BBAddGameTableViewCell *cell=(BBAddGameTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle bundleForClass:[NSClassFromString(@"BBAddGameTableViewCell") class]]];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        cell = (BBAddGameTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.cornerRadius = 5;
    self.bgView.layer.masksToBounds = YES;
    self.headerImageView.layer.cornerRadius = 30;
    self.headerImageView.layer.masksToBounds = YES;
    self.addBtn.layer.cornerRadius = 15;
    self.addBtn.layer.masksToBounds = YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
