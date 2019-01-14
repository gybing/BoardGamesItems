//
//  FillContantTableViewCell.h
//  JSNotepadProject
//
//  Created by 刘成 on 2018/11/15.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKFillContantTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;

+ (KKFillContantTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
