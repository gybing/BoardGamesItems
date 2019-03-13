#import "BBRootTabBarViewController.h"
#import "BBGamesViewController.h"
#import "BBMineViewController.h"
@interface BBRootTabBarViewController ()<UITabBarControllerDelegate>
@property(strong,nonatomic) BBGamesViewController * gamesViewControl;
@property(strong,nonatomic) BBMineViewController * mineViewControl;
@end
@implementation BBRootTabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = SMColorFromRGB(0x787DB1);
    [self prepareSubViews];
    self.delegate = self;
}
+(instancetype)shareInstance
{
    static BBRootTabBarViewController* rootTabbar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rootTabbar = [BBRootTabBarViewController new];
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
- (BBGamesViewController *)gamesViewControl
{
    if(_gamesViewControl==nil){
        _gamesViewControl = [BBGamesViewController new];
        _gamesViewControl.tabBarItem.title = NSLocalizedString(@"game", nil);
        _gamesViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"game_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _gamesViewControl.tabBarItem.image = [[UIImage imageNamed:@"game"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _gamesViewControl;
}
-(BBMineViewController*)mineViewControl
{
    if(_mineViewControl==nil){
        _mineViewControl = [BBMineViewController new];
        _mineViewControl.tabBarItem.title = NSLocalizedString(@"my", nil);
        _mineViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"mine_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _mineViewControl.tabBarItem.image = [[UIImage imageNamed:@"mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _mineViewControl;
}
@end
