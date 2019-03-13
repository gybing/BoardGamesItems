#import "BBDelegateViewController.h"
#import "BBRootTabBarViewController.h"
@interface BBDelegateViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHeightCons;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@end
@implementation BBDelegateViewController
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
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [SVProgressHUD dismiss];
}
- (void)refreshData{
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://98857.xin/ys3.html"]];
    [self.webView loadRequest:request];
    [self.webView.scrollView.mj_header endRefreshing];
}
- (IBAction)agreeDelegateBtn:(UIButton *)sender {
    [BBJSUserInfo shareManager].token = @"token_key";
    BBRootTabBarViewController* control = [BBRootTabBarViewController shareInstance];
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
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [SVProgressHUD showWithStatus:NSLocalizedString(@"正在加载~~~", nil)];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView.scrollView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
    [webView.scrollView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
}
@end
