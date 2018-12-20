//
//  MineViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "MineViewController.h"
#import "PersonViewController.h"
#import "MineTableViewCell.h"
#import "AboutMineViewController.h"
#import "MMCleanCacheManager.h"
#import "OpinionViewController.h"
#import "DelegateViewController.h"

const CGFloat BackGroupHeight = 200;
const CGFloat HeadImageHeight= 90;

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    UIImageView *imageBG;
    UIImageView *headImageView;
    UILabel *nameLabel;
    UILabel *titleLabel;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset=UIEdgeInsetsMake(BackGroupHeight, 0, 0, 0);
    [self cusotmHeaderView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    if ([JSUserInfo shareManager].header_image != nil) {
        headImageView.image = [JSUserInfo shareManager].header_image;
    }
    if ([JSUserInfo shareManager].nickName.length>0) {
        nameLabel.text = [JSUserInfo shareManager].nickName;
    }
    
    if ([JSUserInfo shareManager].signature.length>0) {
        titleLabel.text = [JSUserInfo shareManager].signature;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)cusotmHeaderView
{
    imageBG = [[UIImageView alloc]init];
    imageBG.frame=CGRectMake(0, -BackGroupHeight, ScreenWidth, BackGroupHeight);
    imageBG.image=[UIImage imageNamed:@"背景.jpg"];
    imageBG.contentMode = UIViewContentModeScaleAspectFill;
    imageBG.layer.masksToBounds = YES;
    [self.tableView addSubview:imageBG];
    
    UIView *BGView=[[UIView alloc]init];
    BGView.backgroundColor=[UIColor clearColor];
    BGView.frame=CGRectMake(0, -BackGroupHeight, ScreenWidth, BackGroupHeight);
    [self.tableView addSubview:BGView];
    
    //
    headImageView=[[UIImageView alloc]init];
    headImageView.image=[UIImage imageNamed:@"type_3c copy"];
    headImageView.layer.cornerRadius = 45;
    headImageView.layer.masksToBounds = YES;
    [BGView addSubview:headImageView];
    
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(BGView.mas_centerX);
        make.top.equalTo(BGView.mas_top).offset(30);
        make.width.mas_offset(HeadImageHeight);
        make.height.mas_offset(HeadImageHeight);
    }];
    //
    
    nameLabel=[[UILabel alloc]init];
    if ([JSUserInfo shareManager].nickName.length==0) {
        NSString *name = [NSLocalizedString(@"昵称", nil) stringByReplacingOccurrencesOfString:@":" withString:@""];
        nameLabel.text = name;
    }
    nameLabel.textAlignment=NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor whiteColor];
    [BGView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(BGView.mas_centerX);
        make.top.equalTo(self->headImageView.mas_bottom).offset(10);
    }];
    
    titleLabel=[[UILabel alloc]init];
    if ([JSUserInfo shareManager].signature.length==0) {
        NSString *name = [NSLocalizedString(@"个性签名", nil) stringByReplacingOccurrencesOfString:@":" withString:@""];
        titleLabel.text = name;
    }
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:11];
    titleLabel.textColor = [UIColor whiteColor];
    [BGView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(BGView.mas_centerX);
        make.top.equalTo(self->nameLabel.mas_bottom).offset(10);
        make.left.equalTo(BGView).offset(20);
        make.right.equalTo(BGView).offset(-20);
    }];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(setUpHeaderImage) forControlEvents:UIControlEventTouchUpInside];
    [BGView addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(BGView);
    }];
    
    
}

-(void)setUpHeaderImage{
    PersonViewController * personVC = [[PersonViewController alloc]init];
    personVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:personVC animated:YES];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset  = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + BackGroupHeight)/2;
    
    if (yOffset < -BackGroupHeight) {
        
        CGRect rect = imageBG.frame;
        rect.origin.y = yOffset;
        rect.size.height =  -yOffset ;
        rect.origin.x = xOffset;
        rect.size.width = ScreenWidth + fabs(xOffset)*2;
        
        imageBG.frame = rect;
    }
    
}


- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 2;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 15)];
    bgview.backgroundColor = [UIColor clearColor];
    return bgview;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineTableViewCell * cell = [MineTableViewCell cellWithTableView:tableView];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.headerImageView.image = [UIImage imageNamed:@"opinion"];
            cell.titleLabel.text = NSLocalizedString(@"feedback", nil);
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.headerImageView.image = [UIImage imageNamed:@"privacy"];
            cell.titleLabel.text = NSLocalizedString(@"PrivacyPolicy", nil);
        } else if (indexPath.row == 1) {
            cell.headerImageView.image = [UIImage imageNamed:@"clear_cache"];
            cell.titleLabel.text = NSLocalizedString(@"ClearcCache", nil);
        }
    } else {
        cell.headerImageView.image = [UIImage imageNamed:@"about_mine"];
        cell.titleLabel.text = NSLocalizedString(@"AboutUs", nil);
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        OpinionViewController * opinionVC = [[OpinionViewController alloc]init];
        opinionVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:opinionVC animated:YES];
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            DelegateViewController * delegateController = [DelegateViewController new];
            delegateController.hidesBottomBarWhenPushed = YES;
            delegateController.isMine = YES;
            [self.navigationController pushViewController:delegateController animated:YES];
        } else {
            WS(wSelf);
            JSCommonAlertView *alter = [[JSCommonAlertView alloc]initWithTitle:NSLocalizedString(@"是否清除缓存?", nil)  textArray:nil textAlignment:TextAlignmentCenter buttonStyle:ButtonLandscapeStyle];
            [alter showAlertView:NSLocalizedString(@"否", nil) sureTitle:NSLocalizedString(@"是", nil) cancelBlock:^{
                
            } sureBlock:^{
                [[MMCleanCacheManager Cachesclear] clearAllCaches];
                [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"清除缓存成功！", nil)];
                [wSelf.tableView reloadData];
            }];
        }
    } else {
        AboutMineViewController * aboutMineVC = [[AboutMineViewController alloc]init];
        aboutMineVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:aboutMineVC animated:YES];
    }
}


@end
