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

@property (nonatomic,strong) NSMutableArray<JSClassModel*> * dataArr;

@end

@implementation AddGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加游戏";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.dataArr = [JSUserInfo shareManager].gamesArray;
    NSArray * array = @[@"拆红包斗地主",@"欢乐斗牛",@"跑得快",@"炸金花",@"大富翁",@"德州扑克",@"疯狂骰子",@"够级",@"挤黑五",@"清墩",@"十三张",@"娱乐场"];
    NSArray * titleArr = @[@"拆红包斗地主，红包多多！",@"欢乐斗牛，欢乐都牛！",@"跑得快，跑得快，看谁跑得快！",@"我是豹子，你呢？",@"大富豪，快乐玩啊！",@"我梭哈！该你了！",@"比比谁点大，看谁更疯狂！",@"你够级的吗？我升级了！",@"快乐挤黑五了！",@"清墩你玩过吗？非常好玩，快快啦！",@"十三张是锻炼智力水平、勇气的纯休闲类游戏！",@"娱乐场，快乐娱乐！"];
    if (self.dataArr.count == 0) {
        for (NSInteger i=0; i<array.count; i++) {
            JSClassModel * model = [[JSClassModel alloc]init];
            model.class_name = array[i];
            model.class_isSelect = @"0";
            model.class_image = array[i];
            model.class_describe = titleArr[i];
            model.numberArr = [NSMutableArray array];
            [self.dataArr addObject:model];
        }
        [JSUserInfo shareManager].gamesArray = self.dataArr;
    }
}

#pragma UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    } else {
        return 6;
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
    if (indexPath.section == 0 && indexPath.row == 5) {
        return 90;
    } else {
        return 110;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JSClassModel * model = self.dataArr[indexPath.section*6 + indexPath.row];
    AddGameTableViewCell * cell = [AddGameTableViewCell cellWithTableView:tableView];
    cell.headerImageView.image = [UIImage imageNamed:model.class_image];
    cell.titleLabel.text = model.class_name;
    cell.noteLabel.text = model.class_describe;
    if ([model.class_isSelect boolValue]) {
        cell.addBtn.layer.borderColor = SMColorFromRGB(0xa6a6a6).CGColor;
        cell.addBtn.layer.borderWidth = 1;
        [cell.addBtn setTitleColor:SMColorFromRGB(0xa6a6a6) forState:UIControlStateNormal];
        cell.addBtn.backgroundColor = [UIColor whiteColor];
        [cell.addBtn setTitle:@"已添加" forState:UIControlStateNormal];
    } else {
        cell.addBtn.layer.borderWidth = 0;
        [cell.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cell.addBtn.backgroundColor = SMMainColor;
        [cell.addBtn setTitle:@"添加" forState:UIControlStateNormal];
    }
    cell.addBtn.tag = 500 + indexPath.section*6+indexPath.row;
    [cell.addBtn addTarget:self action:@selector(addGamesList:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)addGamesList:(UIButton*)sender{
    JSClassModel * model = self.dataArr[sender.tag-500];
    if ([model.class_isSelect boolValue]) {
        model.class_isSelect = @"0";
        model.numberArr = [NSMutableArray array];
    } else {
        model.class_isSelect = @"1";
    }
    [JSUserInfo shareManager].gamesArray = self.dataArr;
    if (sender.tag-500>5) {
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:sender.tag-500-6 inSection:1];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    } else {
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:sender.tag-500 inSection:0];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }
//    [self.tableView reloadData];
}


-(NSMutableArray<JSClassModel *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
