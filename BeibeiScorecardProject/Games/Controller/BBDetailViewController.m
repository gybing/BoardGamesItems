#import "BBDetailViewController.h"
#import "BBDetailTableViewCell.h"
#import "BBDeleteViewController.h"
#import "BBAddNumberViewController.h"
@interface BBDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *addStoreBtn;
@property (weak, nonatomic) IBOutlet UILabel *totalScoreLabel;
@end
@implementation BBDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(self.titleStr,nil),NSLocalizedString(@"计分器", nil)];
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
        BBJSFastLoginModel * model = self.dataArr[i];
        if ([model.class_isAdd boolValue]) {
            total_count = total_count + model.class_number.integerValue;
        } else {
            total_count = total_count - model.class_number.integerValue;
        }
    }
    NSString * str;
    if (total_count>0) {
        str = [NSString stringWithFormat:@"+%ld",(long)total_count];
    } else if (total_count==0) {
        str = @"0";
    } else {
        str = [NSString stringWithFormat:@"%ld",(long)total_count];
        self.totalLabel.text = [NSString stringWithFormat:@"%ld",(long)total_count];
    }
    UIFont *boldFont = [UIFont boldSystemFontOfSize:32];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    [attrString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0, str.length)];
    self.totalLabel.attributedText = attrString;
}
- (IBAction)addGameNumberBtn:(UIButton *)sender {
    WS(wSelf);
    BBAddNumberViewController * addNumberVC = [[BBAddNumberViewController alloc]init];
    addNumberVC.returnAddBlock = ^(BBJSFastLoginModel * addModel){
        addModel.class_name = wSelf.titleStr;
        addModel.class_image = wSelf.imageStr;
        [wSelf.dataArr insertObject:addModel atIndex:0];
        [wSelf getTotalData];
        [wSelf.tableView reloadData];
        NSMutableArray * array = [BBJSUserInfo shareManager].gamesArray;
        for (NSInteger i=0; i<array.count; i++) {
            BBJSClassModel * classModel = array[i];
            if ([classModel.class_name isEqualToString:self.titleStr]) {
                classModel.numberArr = wSelf.dataArr;
                [array replaceObjectAtIndex:i withObject:classModel];
            }
        }
        [BBJSUserInfo shareManager].gamesArray = array;
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
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 15)];
    bgView.backgroundColor = [UIColor clearColor];
    return bgView;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BBJSFastLoginModel * model = self.dataArr[indexPath.row];
    BBDetailTableViewCell * cell = [BBDetailTableViewCell cellWithTableView:tableView];
    cell.headerImageView.image = [UIImage imageNamed:NSLocalizedString(model.class_image,nil)];
    cell.dayLabel.text = model.class_day;
    cell.weekLabel.text = model.class_week;
    cell.dateLabel.text = model.class_year;
    cell.titleLabel.text = NSLocalizedString(model.class_name,nil);
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
    BBJSFastLoginModel * model = self.dataArr[indexPath.row];
    BBDeleteViewController * deleteVC = [[BBDeleteViewController alloc]init];
    deleteVC.model = model;
    deleteVC.returnDeleteBlock = ^(void){
        [wSelf.dataArr removeObject:model];
        [wSelf getTotalData];
        [wSelf.tableView reloadData];
        NSMutableArray * array = [BBJSUserInfo shareManager].gamesArray;
        for (NSInteger i=0; i<array.count; i++) {
            BBJSClassModel * classModel = array[i];
            if ([classModel.class_name isEqualToString:self.titleStr]) {
                classModel.numberArr = wSelf.dataArr;
                [array replaceObjectAtIndex:i withObject:classModel];
            }
        }
        [BBJSUserInfo shareManager].gamesArray = array;
        [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"删除成功！", nil)];
    };
    [self.navigationController pushViewController:deleteVC animated:YES];
}
@end
