//
//  JSRootTabBarViewController.m
//  JSNotepadProject
//
//  Created by 刘成 on 2018/11/12.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import "JSRootTabBarViewController.h"
#import "GamesViewController.h"
#import "MineViewController.h"

@interface JSRootTabBarViewController ()<UITabBarControllerDelegate>

@property(strong,nonatomic) GamesViewController * gamesViewControl;

@property(strong,nonatomic) MineViewController * mineViewControl;

@end

@implementation JSRootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = SMColorFromRGB(0x787DB1);
    //全局tab属性配置
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"" size:12]} forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"" size:12]} forState:UIControlStateSelected];
    [self prepareSubViews];
    self.delegate = self;
}

+(instancetype)shareInstance
{
    static JSRootTabBarViewController* rootTabbar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rootTabbar = [JSRootTabBarViewController new];
    });
    return rootTabbar;
}


#pragma mark - Delegate & DataSource
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if([item.title isEqualToString:@""]){
        
    }
    
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    //拦截记账
//    if([tabBarController.viewControllers indexOfObject:viewController] == 2){
//        if([self.viewControllers indexOfObject:self.selectedViewController] != 2){
//            HomeViewController * homeViewControl = [HomeViewController new];
//            homeViewControl.hidesBottomBarWhenPushed = YES;
//            [((UINavigationController*)tabBarController.selectedViewController).topViewController presentViewController:[[UINavigationController alloc]initWithRootViewController:homeViewControl] animated:YES completion:nil];
//        }
//        return NO;
//    }
    return YES;
}
    
#pragma mark - 初始化子视图
    -(void)prepareSubViews
    {
    [self rootMainSubViews];
}

-(void)rootMainSubViews
{

    UINavigationController* gamesNav = [[UINavigationController alloc]initWithRootViewController:self.gamesViewControl];

    UINavigationController* mineNav = [[UINavigationController alloc]initWithRootViewController:self.mineViewControl];
    
    self.viewControllers = @[gamesNav,mineNav];
}
#pragma mark - getter & setter

- (GamesViewController *)gamesViewControl
{
    if(_gamesViewControl==nil){
        _gamesViewControl = [GamesViewController new];
        _gamesViewControl.tabBarItem.title = @"游戏";
        _gamesViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"game_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _gamesViewControl.tabBarItem.image = [[UIImage imageNamed:@"game"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _gamesViewControl;
}


-(MineViewController*)mineViewControl
{
    if(_mineViewControl==nil){
        _mineViewControl = [MineViewController new];
        _mineViewControl.tabBarItem.title = @"我的";
        _mineViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"mine_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _mineViewControl.tabBarItem.image = [[UIImage imageNamed:@"mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _mineViewControl;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
