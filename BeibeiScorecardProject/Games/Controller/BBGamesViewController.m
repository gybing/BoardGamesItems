#import "BBGamesViewController.h"
#import "BBGamesTableViewCell.h"
#import "BBDetailViewController.h"
#import "BBAddGameViewController.h"
@interface BBGamesViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray<BBJSClassModel*> * dataArr;
@end
@implementation BBGamesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"game", nil);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"tianjia"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(addGamesList)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.dataArr removeAllObjects];
    NSMutableArray * array = [BBJSUserInfo shareManager].gamesArray;
    for (NSInteger i=0; i<array.count; i++) {
        BBJSClassModel * model = array[i];
        if ([model.class_isSelect boolValue]) {
            [self.dataArr addObject:model];
        }
    }
    [self.tableView reloadData];
}
-(void)addGamesList{
    BBAddGameViewController * addGameVC = [[BBAddGameViewController alloc]init];
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
    BBGamesTableViewCell * cell = [BBGamesTableViewCell cellWithTableView:tableView];
    BBJSClassModel * model = self.dataArr[indexPath.row];
    NSString * str = NSLocalizedString(model.class_name,nil);
    UIFont *boldFont = [UIFont boldSystemFontOfSize:20];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    [attrString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0, str.length)];
    cell.titleLabel.attributedText = attrString;
    cell.headerImageView.image = [UIImage imageNamed:NSLocalizedString(model.class_image,nil)];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BBJSClassModel * model = self.dataArr[indexPath.row];
    BBDetailViewController * detailVC = [[BBDetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    detailVC.dataArr = model.numberArr;
    detailVC.titleStr = model.class_name;
    detailVC.imageStr = model.class_image;
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(NSMutableArray<BBJSClassModel *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
