//
//  DeleteViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "DeleteViewController.h"
#import "DeleteTableViewCell.h"

@interface DeleteViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(self.model.class_name,nil);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.deleteBtn setTitle:NSLocalizedString(@"删除", nil) forState:UIControlStateNormal];
}


- (IBAction)deleteDataBtn:(UIButton *)sender {
    WS(wSelf);
    JSCommonAlertView *alter = [[JSCommonAlertView alloc]initWithTitle:NSLocalizedString(@"确定删除吗？", nil) textArray:nil textAlignment:TextAlignmentCenter buttonStyle:ButtonLandscapeStyle];
    [alter showAlertView:NSLocalizedString(@"取消", nil) sureTitle:NSLocalizedString(@"确定", nil) cancelBlock:^{
        
    } sureBlock:^{
        if (wSelf.returnDeleteBlock) {
            //将自己的值传出去，完成传值
            wSelf.returnDeleteBlock();
        }
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
}

#pragma UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.model.class_note.length>0) {
        return 4;
    } else {
      return 3;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    bgView.backgroundColor = [UIColor clearColor];
    return bgView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeleteTableViewCell * cell = [DeleteTableViewCell cellWithTableView:tableView];
    if (indexPath.row == 0) {
        cell.titleLabel.text = NSLocalizedString(@"得分", nil);
        if ([self.model.class_isAdd boolValue]) {
            cell.noteLabel.text = [NSString stringWithFormat:@"+%@",self.model.class_number];
        }else{
            cell.noteLabel.text = [NSString stringWithFormat:@"-%@",self.model.class_number];
        }
        
    } else if (indexPath.row == 1) {
        cell.titleLabel.text = NSLocalizedString(@"类型", nil);
        cell.noteLabel.text = NSLocalizedString(self.model.class_name,nil);
    } else if (indexPath.row == 2) {
        cell.titleLabel.text = NSLocalizedString(@"时间", nil);
        cell.noteLabel.text = [NSString stringWithFormat:@"%@.%@ %@",self.model.class_year,self.model.class_day,self.model.class_hour];
    } else {
        cell.titleLabel.text = NSLocalizedString(@"备注", nil);
        cell.noteLabel.text = self.model.class_note;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
