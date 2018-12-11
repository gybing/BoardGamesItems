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

@property (nonatomic,strong)NSMutableArray<JSClassModel*> * dataArr;

@end

@implementation GamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"游戏";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"add_games"] style:UIBarButtonItemStylePlain target:self action:@selector(addGamesList)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.dataArr removeAllObjects];
    NSMutableArray * array = [JSUserInfo shareManager].gamesArray;
    for (NSInteger i=0; i<array.count; i++) {
        JSClassModel * model = array[i];
        if ([model.class_isSelect boolValue]) {
            [self.dataArr addObject:model];
        }
    }
    [self.tableView reloadData];
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
    if (self.dataArr.count == 0) {
        [self.tableView showEmptyView];
    }
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GamesTableViewCell * cell = [GamesTableViewCell cellWithTableView:tableView];
    JSClassModel * model = self.dataArr[indexPath.row];
    cell.titleLabel.text = model.class_name;
    cell.headerImageView.image = [UIImage imageNamed:model.class_image];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JSClassModel * model = self.dataArr[indexPath.row];
    DetailViewController * detailVC = [[DetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    detailVC.dataArr = model.numberArr;
    detailVC.titleStr = model.class_name;
    detailVC.imageStr = model.class_image;
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(NSMutableArray<JSClassModel *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
