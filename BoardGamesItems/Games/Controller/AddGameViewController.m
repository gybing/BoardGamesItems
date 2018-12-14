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
    self.navigationItem.title = NSLocalizedString(@"添加游戏", nil);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [JSUserInfo shareManager].gamesArray = [NSMutableArray array];
    NSArray * imageArr = @[NSLocalizedString(@"拆红包斗地主图片", nil),NSLocalizedString(@"欢乐斗牛图片", nil),NSLocalizedString(@"跑得快图片", nil),NSLocalizedString(@"炸金花图片", nil),NSLocalizedString(@"大富翁图片", nil),NSLocalizedString(@"德州扑克图片", nil),NSLocalizedString(@"疯狂骰子图片", nil),NSLocalizedString(@"够级图片", nil),NSLocalizedString(@"挤黑五图片", nil),NSLocalizedString(@"清墩图片", nil),NSLocalizedString(@"十三张图片", nil),NSLocalizedString(@"娱乐场图片", nil)];
    self.dataArr = [JSUserInfo shareManager].gamesArray;
    NSArray * array = @[NSLocalizedString(@"拆红包斗地主", nil),NSLocalizedString(@"欢乐斗牛", nil),NSLocalizedString(@"跑得快", nil),NSLocalizedString(@"炸金花", nil),NSLocalizedString(@"大富翁", nil),NSLocalizedString(@"德州扑克", nil),NSLocalizedString(@"疯狂骰子", nil),NSLocalizedString(@"够级", nil),NSLocalizedString(@"挤黑五", nil),NSLocalizedString(@"清墩", nil),NSLocalizedString(@"十三张", nil),NSLocalizedString(@"娱乐场", nil)];
    NSArray * titleArr = @[NSLocalizedString(@"拆红包斗地主描述", nil),NSLocalizedString(@"欢乐斗牛描述", nil),NSLocalizedString(@"跑得快描述", nil),NSLocalizedString(@"炸金花描述", nil),NSLocalizedString(@"大富翁描述", nil),NSLocalizedString(@"德州扑克描述", nil),NSLocalizedString(@"疯狂骰子描述", nil),NSLocalizedString(@"够级描述", nil),NSLocalizedString(@"挤黑五描述", nil),NSLocalizedString(@"清墩描述", nil),NSLocalizedString(@"十三张描述", nil),NSLocalizedString(@"娱乐场描述", nil)];
    if (self.dataArr.count == 0) {
        for (NSInteger i=0; i<array.count; i++) {
            JSClassModel * model = [[JSClassModel alloc]init];
            model.class_name = array[i];
            model.class_isSelect = @"0";
            model.class_image = imageArr[i];
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
        label.text = NSLocalizedString(@"最新游戏", nil);
    } else {
        label.text = NSLocalizedString(@"最热游戏", nil);
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
        [cell.addBtn setTitle:NSLocalizedString(@"已添加", nil) forState:UIControlStateNormal];
    } else {
        cell.addBtn.layer.borderWidth = 0;
        [cell.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cell.addBtn.backgroundColor = SMMainColor;
        [cell.addBtn setTitle:NSLocalizedString(@"添加", nil) forState:UIControlStateNormal];
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
