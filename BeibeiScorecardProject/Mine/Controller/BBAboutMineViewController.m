#import "BBAboutMineViewController.h"
@interface BBAboutMineViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bundleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation BBAboutMineViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"AboutUs", nil);
    self.nameLabel.text = NSLocalizedString(@"楷楷计分器", nil);
    self.bundleLabel.text = NSLocalizedString(@"版本号：", nil);
    self.titleLabel.text = NSLocalizedString(@"楷楷计分器描述", nil);
}
@end
