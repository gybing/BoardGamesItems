#import "BBViewController.h"
#import "BBIudgeViewController.h"
@interface BBViewController ()
@end
@implementation BBViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    BBIudgeViewController * iudgevc = [[BBIudgeViewController alloc]init];
    KEY_WINDOW.rootViewController = iudgevc;
}
@end
