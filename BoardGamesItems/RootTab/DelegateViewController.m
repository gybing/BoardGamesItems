//
//  DelegateViewController.m
//  JSNotepadProject
//
//  Created by 刘成 on 2018/11/21.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import "DelegateViewController.h"
#import "JSRootTabBarViewController.h"

@interface DelegateViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHeightCons;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;

@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"隐私协议", nil);
    [self.agreeBtn setTitle:NSLocalizedString(@"同意", nil) forState:UIControlStateNormal];
    self.webView.scrollView.backgroundColor = [UIColor whiteColor];
    if (self.isMine) {
        self.bottomHeightCons.constant = 0;
    } else {
        self.bottomHeightCons.constant = 50;
    }
    self.webView.delegate = self;
    [SVProgressHUD showWithStatus:NSLocalizedString(@"正在加载~~~", nil)];
    [self refreshData];
    self.webView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
}

- (void)refreshData{
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://98857.xin/ys3.html"]];
    [self.webView loadRequest:request];
    [self.webView.scrollView.mj_header endRefreshing];
}


- (IBAction)agreeDelegateBtn:(UIButton *)sender {
    [JSUserInfo shareManager].token = @"token_key";
    JSRootTabBarViewController* control = [JSRootTabBarViewController shareInstance];
    KEY_WINDOW.rootViewController = control;
}

#pragma mark - === UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSArray *nCookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *  Cookie in nCookies ) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:Cookie];
    }
    
    NSURL *URL=request.URL;
    NSString *scheme=[URL scheme];
    
    if ([scheme isEqualToString:@"http"]||[scheme isEqualToString:@"https"]) {
        return YES;
    }
    else{
        [[UIApplication sharedApplication]openURL:URL];
        return NO;
    }
}
//开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [SVProgressHUD showWithStatus:NSLocalizedString(@"正在加载~~~", nil)];
}
//加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView.scrollView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
}
//开始失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
    [webView.scrollView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
}

@end
