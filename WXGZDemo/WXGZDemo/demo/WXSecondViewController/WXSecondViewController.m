//
//  WXViewController2.m
//
//  Created by 谭建中 on 1/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXSecondViewController.h"
#import <WebKit/WebKit.h>

#import "Masonry.h"

static NSString *const kUrl = @"https://www.sina.com";
@interface WXSecondViewController () <WKUIDelegate, WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *myWebview;
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation WXSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"H5元素";
    [self initUI];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kUrl]];
    [self.myWebview loadRequest:request];
    
}
- (void)addLeftItem
{
    
}
- (void)initUI {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:nil];
    
    self.myWebview = [WKWebView new];
    self.myWebview.UIDelegate = self;
    self.myWebview.navigationDelegate = self;
    [self.view addSubview:self.myWebview];
    
    [self.myWebview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    self.progressView = UIProgressView.new;
    self.progressView.progressTintColor = [UIColor greenColor];
    self.progressView.alpha = 0.3;
    [self.view addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(2);
    }];
    
    // 给webview添加监听
    [self.myWebview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self addRightItem];
}
//- (void)addRightItem
//{
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"返回上一页" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//    rightItem.tintColor = [UIColor whiteColor];
//    self.navigationItem.rightBarButtonItem = rightItem;
//}
- (void)back {
    if (self.myWebview.canGoBack) {
        [self.myWebview goBack];
    }else {
        NSLog(@"没有上一页");
    }
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    //    NSLog(@"webVC: didStartProvisionalNavigation:%@\n", webView.URL.absoluteString);
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    //    NSLog(@"didReceiveServerRedirectForProvisionalNavigation\n");
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    //    NSLog(@"didCommitNavigation\n");
    
    
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
}

// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
    //    NSLog(@"decidePolicyForNavigationResponse：%@\n", webView.URL.absoluteString);
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
    //    NSLog(@"decidePoli/cyForNavigationAction\n%@\n\n", webView.URL.absoluteString);
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"网页加载完成");
}

#pragma mark - WKUIDelegate
//接收到警告面板
//- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
//{
//    completionHandler();
//}
//接收到确认面板
//- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler
//{
//   return completionHandler(YES);
//}
//接收到输入框
//- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler
//{
//
//}
#pragma mark - observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqual:@"estimatedProgress"] && object == self.myWebview) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.myWebview.estimatedProgress animated:YES];
        if (self.myWebview.estimatedProgress  >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:YES];
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc{
    [self.myWebview removeObserver:self forKeyPath:@"estimatedProgress"];
}

#pragma mark - private
- (NSString *)readLocalTextFileWithName:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSString *js = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return js;
}



@end
