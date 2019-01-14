//
//  AboutMineViewController.m
//  JSHeartDiary
//
//  Created by 锋子 on 2018/11/30.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "KKAboutMineViewController.h"

@interface KKAboutMineViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bundleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation KKAboutMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"AboutUs", nil);
    self.nameLabel.text = NSLocalizedString(@"楷楷计分器", nil);
    self.bundleLabel.text = NSLocalizedString(@"版本号：", nil);
    self.titleLabel.text = NSLocalizedString(@"楷楷计分器描述", nil);
}



@end
