//
//  WebController.m
//  ExampleApp-iOS
//
//  Created by Marcus Westin on 1/13/14.
//  Copyright (c) 2014 Marcus Westin. All rights reserved.
//

#import "WebController.h"
#import "WebViewJavascriptBridge.h"

@interface WebController ()

@property WebViewJavascriptBridge* bridge;

@end

@implementation WebController

- (void)loadExamplePage:(WKWebView*)webView {
    
    NSURL *baseURL = [NSURL URLWithString:@"http://60.205.213.234:8080/WebApp"];
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:baseURL];
    [webView loadRequest:urlReq];
}

-(void)viewDidLoad {
    [super viewDidLoad];
//    if (_bridge) { return; }
    
    WKWebView* webView = [[NSClassFromString(@"WKWebView") alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    webView.scrollView.bounces = NO;
    webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:webView];
    [WebViewJavascriptBridge enableLogging];
    _bridge = [WebViewJavascriptBridge bridgeForWebView:webView];
    [_bridge setWebViewDelegate:self];
    [self loadExamplePage:webView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"webViewDidStartLoad");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"webViewDidFinishLoad");
}



@end
