//
//  AddNumberViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "AddNumberViewController.h"
#import "AddNumberTableViewCell.h"

@interface AddNumberViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@property (nonatomic,assign) BOOL isAdd;



@end

@implementation AddNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加得分";
    self.isAdd = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(addNumber)];
    self.addBtn.layer.cornerRadius = 15;
    self.addBtn.layer.masksToBounds = YES;
    
    self.deleteBtn.layer.cornerRadius = 15;
    self.deleteBtn.layer.masksToBounds = YES;
    [self customAddAndDelete:YES];
    
}

-(void)addNumber{
    
}

-(void)customAddAndDelete:(BOOL)isAdd{
    if (isAdd) {
        self.addBtn.backgroundColor = SMColorFromRGB(0x777CB5);
        self.addBtn.layer.borderWidth = 0;
        [self.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        self.deleteBtn.backgroundColor = [UIColor whiteColor];
        self.deleteBtn.layer.borderWidth = 1;
        self.deleteBtn.layer.borderColor = SMColorFromRGB(0x808080).CGColor;
        [self.deleteBtn setTitleColor:SMColorFromRGB(0x808080) forState:UIControlStateNormal];
    } else {
        self.addBtn.backgroundColor = [UIColor whiteColor];
        self.addBtn.layer.borderWidth = 1;
        self.addBtn.layer.borderColor = SMColorFromRGB(0x808080).CGColor;
        [self.addBtn setTitleColor:SMColorFromRGB(0x808080) forState:UIControlStateNormal];
        
        self.deleteBtn.backgroundColor = SMColorFromRGB(0x777CB5);
        self.deleteBtn.layer.borderWidth = 0;
        [self.deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (IBAction)addNumberBtn:(UIButton *)sender {
    self.isAdd = YES;
    [self customAddAndDelete:self.isAdd];
}


- (IBAction)deleteNumberBtn:(id)sender {
    self.isAdd = NO;
    [self customAddAndDelete:self.isAdd];
}


#pragma UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
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
    AddNumberTableViewCell * cell = [AddNumberTableViewCell cellWithTableView:tableView];
    @weakify(self);
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"本届得分：";
        cell.noteField.placeholder = @"请输入本届得分";
        cell.noteField.keyboardType = UIKeyboardTypeNumberPad;
        [[cell.noteField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
//            self.signature = x;
        }];
    } else {
        cell.titleLabel.text = @"备注：";
        cell.noteField.placeholder = @"请输入备注";
        cell.noteField.keyboardType = UIKeyboardTypeDefault;
        [[cell.noteField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
//            self.signature = x;
        }];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
