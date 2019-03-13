#import "BBGamesTableViewCell.h"
@implementation BBGamesTableViewCell
+ (BBGamesTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"BBGamesTableViewCell";
    BBGamesTableViewCell *cell=(BBGamesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle bundleForClass:[NSClassFromString(@"BBGamesTableViewCell") class]]];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        cell = (BBGamesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, ScreenWidth)];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.headerImageView.layer.cornerRadius = 40;
    self.headerImageView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 5;
    self.bgView.layer.masksToBounds = YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
