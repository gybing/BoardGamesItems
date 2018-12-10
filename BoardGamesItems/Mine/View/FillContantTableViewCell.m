//
//  FillContantTableViewCell.m
//  JSNotepadProject
//
//  Created by 刘成 on 2018/11/15.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import "FillContantTableViewCell.h"

@implementation FillContantTableViewCell

+ (FillContantTableViewCell *)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"FillContantTableViewCell";
    FillContantTableViewCell *cell=(FillContantTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle bundleForClass:[NSClassFromString(@"FillContantTableViewCell") class]]];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        cell = (FillContantTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
