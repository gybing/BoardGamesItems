#import "BBPersonalTableViewCell.h"
@implementation BBPersonalTableViewCell
+ (BBPersonalTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"BBPersonalTableViewCell";
    BBPersonalTableViewCell *cell=(BBPersonalTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle bundleForClass:[NSClassFromString(@"BBPersonalTableViewCell") class]]];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        cell = (BBPersonalTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.headerImageView.layer.cornerRadius = 20;
    self.headerImageView.layer.masksToBounds = YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
