//
//  AboutMineViewController.m
//  JSHeartDiary
//
//  Created by 锋子 on 2018/11/30.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "AboutMineViewController.h"

@interface AboutMineViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bundleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation AboutMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"AboutUs", nil);
    self.nameLabel.text = NSLocalizedString(@"楷楷计分器", nil);
    self.bundleLabel.text = NSLocalizedString(@"版本号：", nil);
    self.titleLabel.text = NSLocalizedString(@"楷楷计分器描述", nil);
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
