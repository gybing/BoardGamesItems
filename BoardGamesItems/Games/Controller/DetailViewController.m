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

@property (weak, nonatomic) IBOutlet UIButton *addStoreBtn;
@property (weak, nonatomic) IBOutlet UILabel *totalScoreLabel;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@",self.titleStr,NSLocalizedString(@"计分器", ni)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.totalScoreLabel.text = NSLocalizedString(@"总得分", nil);
    [self.addStoreBtn setTitle:NSLocalizedString(@"添加游戏得分", nil) forState:UIControlStateNormal];
    [self getTotalData];
}

-(void)getTotalData{
    NSInteger total_count;
    total_count = 0;
    for (NSInteger i=0; i<self.dataArr.count; i++) {
        JSFastLoginModel * model = self.dataArr[i];
        if ([model.class_isAdd boolValue]) {
            total_count = total_count + model.class_number.integerValue;
        } else {
            total_count = total_count - model.class_number.integerValue;
        }
    }
    if (total_count>0) {
        self.totalLabel.text = [NSString stringWithFormat:@"+%ld",(long)total_count];
    } else if (total_count==0) {
        self.totalLabel.text = @"0";
    } else {
        self.totalLabel.text = [NSString stringWithFormat:@"%ld",(long)total_count];
    }
    
}

- (IBAction)addGameNumberBtn:(UIButton *)sender {
    WS(wSelf);
    AddNumberViewController * addNumberVC = [[AddNumberViewController alloc]init];
    addNumberVC.returnAddBlock = ^(JSFastLoginModel * addModel){
        addModel.class_name = wSelf.titleStr;
        addModel.class_image = wSelf.imageStr;
        [wSelf.dataArr insertObject:addModel atIndex:0];
        [wSelf getTotalData];
        [wSelf.tableView reloadData];
        NSMutableArray * array = [JSUserInfo shareManager].gamesArray;
        for (NSInteger i=0; i<array.count; i++) {
            JSClassModel * classModel = array[i];
            if ([classModel.class_name isEqualToString:self.titleStr]) {
                classModel.numberArr = wSelf.dataArr;
                [array replaceObjectAtIndex:i withObject:classModel];
            }
        }
        [JSUserInfo shareManager].gamesArray = array;
        [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"添加成功!", nil)];
    };
    
    [self.navigationController pushViewController:addNumberVC animated:YES];
}


#pragma UITableViewDataSource,UITableViewDelegate

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
    return 70;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JSFastLoginModel * model = self.dataArr[indexPath.row];
    DetailTableViewCell * cell = [DetailTableViewCell cellWithTableView:tableView];
    cell.headerImageView.image = [UIImage imageNamed:model.class_image];
    cell.dayLabel.text = model.class_day;
    cell.weekLabel.text = model.class_week;
    cell.dateLabel.text = model.class_year;
    cell.titleLabel.text = model.class_name;
    if ([model.class_isAdd boolValue]) {
        cell.numberLabel.text = [NSString stringWithFormat:@"+%@",model.class_number];
    } else {
        cell.numberLabel.text = [NSString stringWithFormat:@"-%@",model.class_number];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WS(wSelf);
    JSFastLoginModel * model = self.dataArr[indexPath.row];
    DeleteViewController * deleteVC = [[DeleteViewController alloc]init];
    deleteVC.model = model;
    deleteVC.returnDeleteBlock = ^(void){
        [wSelf.dataArr removeObject:model];
        [wSelf getTotalData];
        [wSelf.tableView reloadData];
        
        NSMutableArray * array = [JSUserInfo shareManager].gamesArray;
        for (NSInteger i=0; i<array.count; i++) {
            JSClassModel * classModel = array[i];
            if ([classModel.class_name isEqualToString:self.titleStr]) {
                classModel.numberArr = wSelf.dataArr;
                [array replaceObjectAtIndex:i withObject:classModel];
            }
        }
        [JSUserInfo shareManager].gamesArray = array;
        [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"删除成功！", nil)];
        
    };
    [self.navigationController pushViewController:deleteVC animated:YES];
}


@end
