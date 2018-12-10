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

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"斗地主";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (IBAction)deleteDataBtn:(UIButton *)sender {
    WS(wSelf);
    JSCommonAlertView *alter = [[JSCommonAlertView alloc]initWithTitle:@"确定删除吗？" textArray:nil textAlignment:TextAlignmentCenter buttonStyle:ButtonLandscapeStyle];
    [alter showAlertView:@"取消" sureTitle:@"确定" cancelBlock:^{
        
    } sureBlock:^{
        
    }];
}

#pragma UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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
        cell.titleLabel.text = @"得分";
        cell.noteLabel.text = @"2000";
    } else if (indexPath.row == 1) {
        cell.titleLabel.text = @"类型";
        cell.noteLabel.text = @"欢乐斗地主";
    } else {
        cell.titleLabel.text = @"时间";
        cell.noteLabel.text = @"2018年10月20日 19:30";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
