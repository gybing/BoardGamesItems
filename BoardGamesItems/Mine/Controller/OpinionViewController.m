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
#import "AFNetworkReachabilityManager.h"

@interface OpinionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,copy) NSString * note;

@property (nonatomic,copy) NSString * email;


@end

@implementation OpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"feedback", nil);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"提交", nil) style:UIBarButtonItemStylePlain target:self action:@selector(setupOpinion)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (BOOL)isReachable
{
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown) {
        return YES;
    } else {
        return [[AFNetworkReachabilityManager sharedManager] isReachable];
    }
}

-(void)setupOpinion{
    if (self.note.length>0&&self.email.length>0) {
        if ([self isReachable]) {
            [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"提交成功！", nil)];
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [SVProgressHUD showInfoWithStatus:NSLocalizedString(@"未连接网络", nil)];
        }
    } else {
        if (self.note.length == 0) {
            [SVProgressHUD showInfoWithStatus:NSLocalizedString(@"反馈意见未填写", nil)];
        } else {
            [SVProgressHUD showInfoWithStatus:NSLocalizedString(@"邮箱未填写", nil)];
        }
        
    }
}

# pragma mark - UITableViewDelegate UITableViewDatasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
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
    if (indexPath.section == 0) {
        FillContantTableViewCell* cell = [FillContantTableViewCell cellWithTableView:tableView];
        cell.textView.PlaceHolder = NSLocalizedString(@"请输入反馈内容", nil);
//        [cell.textView becomeFirstResponder];
        [[cell.textView rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
            self.note = x;
        }];
        return cell;
    } else {
        AddNumberTableViewCell* cell = [AddNumberTableViewCell cellWithTableView:tableView];
        cell.titleLabel.text = NSLocalizedString(@"邮箱：", nil);
        cell.noteField.placeholder = NSLocalizedString(@"请输入邮箱", nil);
        [[cell.noteField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
            self.email = x;
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
