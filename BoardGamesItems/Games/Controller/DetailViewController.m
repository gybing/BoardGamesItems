//
//  DetailViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"
#import "DeleteViewController.h"
#import "AddNumberViewController.h"

@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray * dataArr;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"斗地主计分器";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (IBAction)addGameNumberBtn:(UIButton *)sender {
    AddNumberViewController * addNumberVC = [[AddNumberViewController alloc]init];
    [self.navigationController pushViewController:addNumberVC animated:YES];
}


#pragma UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [self.tableView hideEmptyView];
    //    if (self.dataArr.count == 0) {
    //        [self.tableView showEmptyView];
    //    }
    return 5;// self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableViewCell * cell = [DetailTableViewCell cellWithTableView:tableView];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    DeleteViewController * deleteVC = [[DeleteViewController alloc]init];
    [self.navigationController pushViewController:deleteVC animated:YES];
}


@end
