//
//  OpinionViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "OpinionViewController.h"
#import "FillContantTableViewCell.h"
#import "AddNumberTableViewCell.h"

@interface OpinionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"意见反馈";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(setupOpinion)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)setupOpinion{
    
}

# pragma mark - UITableViewDelegate UITableViewDatasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 150;
    } else {
        return 50;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor clearColor];
    return bgView;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    @weakify(self);
    if (indexPath.row == 0) {
        FillContantTableViewCell* cell = [FillContantTableViewCell cellWithTableView:tableView];
        cell.textView.PlaceHolder = @"请输入反馈内容";
        [[cell.textView rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
//            self.signature = x;
        }];
        return cell;
    } else {
        AddNumberTableViewCell* cell = [AddNumberTableViewCell cellWithTableView:tableView];
        cell.titleLabel.text = @"邮箱：";
        cell.noteField.placeholder = @"请输入邮箱";
        [[cell.noteField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
//            self.signature = x;
        }];
        return cell;
    }
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

@end
