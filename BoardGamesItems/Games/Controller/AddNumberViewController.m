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
@property (weak, nonatomic) IBOutlet UILabel *score;

@property (nonatomic,strong) JSFastLoginModel * model;

@property (nonatomic,assign) BOOL isAdd;



@end

@implementation AddNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"添加得分", nil);
    self.isAdd = YES;
    self.model.class_isAdd = @"1";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"保存", nil)  style:UIBarButtonItemStylePlain target:self action:@selector(addNumber)];
    self.addBtn.layer.cornerRadius = 15;
    self.addBtn.layer.masksToBounds = YES;
    self.score.text = NSLocalizedString(@"得分", nil);
    
    self.deleteBtn.layer.cornerRadius = 15;
    self.deleteBtn.layer.masksToBounds = YES;
    [self customAddAndDelete:YES];
    
}

-(void)addNumber{
    if (self.model.class_number.length==0) {
        [SVProgressHUD showInfoWithStatus:NSLocalizedString(@"请输入本届得分", nil)];
        return;
    }
//    if (self.model.class_note.length==0) {
//        [SVProgressHUD showInfoWithStatus:@"请输入备注信息！"];
//        return;
//    }
    [self customTimeModel];
    if (self.returnAddBlock) {
        self.returnAddBlock(self.model);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)customTimeModel{
    NSArray * arrWeek=[NSArray arrayWithObjects:NSLocalizedString(@"周六", nil),NSLocalizedString(@"周日", nil),NSLocalizedString(@"周一", nil),NSLocalizedString(@"周二", nil),NSLocalizedString(@"周三", nil),NSLocalizedString(@"周四", nil),NSLocalizedString(@"周五", nil), nil];
    NSDate *date = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitWeekday | NSCalendarUnitHour |NSCalendarUnitMinute |NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    NSInteger year=[comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hours = [comps hour];
    NSInteger minutes = [comps minute];
//    NSInteger seconds = [comps second];
    self.model.class_year = [NSString stringWithFormat:@"%ld.%ld",year,month];
    if (day<10) {
        self.model.class_day = [NSString stringWithFormat:@"0%ld",day];
    } else {
        self.model.class_day = [NSString stringWithFormat:@"%ld",day];
    }
    self.model.class_week = [arrWeek objectAtIndex:week%7];
    self.model.class_hour = [NSString stringWithFormat:@"%ld:%ld",hours,minutes];
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
    self.model.class_isAdd = @"1";
    [self customAddAndDelete:self.isAdd];
}


- (IBAction)deleteNumberBtn:(id)sender {
    self.isAdd = NO;
    self.model.class_isAdd = @"0";
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
    return 15;
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
        cell.titleLabel.text = NSLocalizedString(@"本届得分：", nil);
        cell.noteField.placeholder = NSLocalizedString(@"请输入本届得分", nil);
        cell.noteField.keyboardType = UIKeyboardTypeNumberPad;
        [[cell.noteField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
            self.model.class_number = x;
        }];
    } else {
        cell.titleLabel.text = NSLocalizedString(@"备注：", nil);
        cell.noteField.placeholder = NSLocalizedString(@"请输入备注", nil);
        cell.noteField.keyboardType = UIKeyboardTypeDefault;
        [[cell.noteField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
            self.model.class_note = x;
        }];
    }
    return cell;
}

-(JSFastLoginModel *)model
{
    if (!_model) {
        _model = [[JSFastLoginModel alloc]init];
    }
    return _model;
}

@end
