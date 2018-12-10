//
//  AddGameViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "AddGameViewController.h"
#import "AddGameTableViewCell.h"

@interface AddGameViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AddGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加游戏";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    } else {
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    bgView.backgroundColor = [UIColor clearColor];
    UIView * leftView = [[UIView alloc] init];
    leftView.backgroundColor = SMColorFromRGB(0x424242);
    [bgView addSubview:leftView];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView.mas_centerY);
        make.left.equalTo(bgView.mas_left).offset(20);
        make.height.mas_offset(14);
        make.width.mas_offset(3);
    }];
    
    UILabel * label = [[UILabel alloc]init];
    label.textColor = SMColorFromRGB(0x101010);
    label.font = [UIFont systemFontOfSize:14];
    if (section == 0) {
        label.text = @"最新游戏";
    } else {
        label.text = @"最热游戏";
    }
    [bgView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView.mas_centerY);
        make.left.equalTo(leftView.mas_right).offset(10);
    }];
    
    return bgView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ((indexPath.section == 0 && indexPath.row == 3)||(indexPath.section == 1 && indexPath.row == 1)) {
        return 90;
    } else {
        return 110;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddGameTableViewCell * cell = [AddGameTableViewCell cellWithTableView:tableView];

    return cell;
}



@end
