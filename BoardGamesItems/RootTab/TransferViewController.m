//
//  TransferViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/12.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "TransferViewController.h"

#import "AppURL.h"
#import "AppDeviceMode.h"
#import "XXRequest.h"
#import "NSString+Code.h"

@interface TransferViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic,strong)    NSDictionary * params;

@end

@implementation TransferViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _webView.delegate = self;
    [self requestMainURL];
}


#pragma mark - == 请求主链接
- (void)requestMainURL
{
    //
    NSMutableDictionary * mbody = [NSMutableDictionary dictionary];
    [mbody setObject:@"GetWebInfo" forKey:@"api"];
    [mbody setObject:app_id forKey:@"app_id"];
    [mbody setObject: getAPP_Number_Version() forKey:@"version"];
    [mbody setObject:app_secret forKey:@"app_secret"];
    [mbody setObject: getPackage_name() forKey:@"package_name"];
    [mbody setObject:market_secret forKey:@"market_secret"];
    [mbody setObject: getAppDeviceInfoStr() forKey:@"Apple_Info"];
    [mbody setObject: _urlID forKey:@"params"];
    
    WeakSelf(self)
    [[XXRequest RequestManager]PostRequestDataWithUrlStr:[NSString stringWithFormat:@"%@%@",[AppURL Manager].HttpHost,APP_API] body:mbody progressBlock:^(NSProgress *progress) {
        
    } success:^(NSObject *successData) {
        //字典:
        NSDictionary * dict = (NSDictionary *)successData;
        if ([[dict objectForKey:@"code"]integerValue] == 100)
        {
            NSString * paramsStr = [dict objectForKey:@"params"];
            if (paramsStr.length > 0)
            {
                weakType.params = (NSDictionary*)[paramsStr codeStringToDictionary];
                NSLog(@"params = %@",weakType.params);
                
                weakType.urlStr = [NSString stringWithBase64EncodedString:[weakType.params objectForKey:@"url_address"]];
                [weakType.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
                weakType.webView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    [weakType.webView reload];
                }];
            }
        }
        
    } fail:^(NSObject *failError) {

    }];
    
    
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
    //    [SVProgressHUD showWithStatus:@"正在加载~~~"];
}
//加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView.scrollView.mj_header endRefreshing];
    //    [SVProgressHUD dismiss];
}
//开始失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
    [webView.scrollView.mj_header endRefreshing];
    //    [SVProgressHUD dismiss];
}


@end
