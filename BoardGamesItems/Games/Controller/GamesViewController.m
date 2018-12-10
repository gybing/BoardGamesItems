//
//  GamesViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "GamesViewController.h"
#import "GamesTableViewCell.h"
#import "DetailViewController.h"
#import "AddGameViewController.h"

@interface GamesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray * dataArr;

@end

@implementation GamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"游戏";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"选中"] style:UIBarButtonItemStylePlain target:self action:@selector(addGamesList)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)addGamesList{
    AddGameViewController * addGameVC = [[AddGameViewController alloc]init];
    addGameVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addGameVC animated:YES];
}

# pragma mark - UITableViewDelegate UITableViewDatasource

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
    return 130;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GamesTableViewCell * cell = [GamesTableViewCell cellWithTableView:tableView];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detailVC = [[DetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}



@end
