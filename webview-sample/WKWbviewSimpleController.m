//
//  WKWbviewSimpleController.m
//  webview-sample
//
//  Created by Venkatakrishnan,Poornima on 2/22/17.
//  Copyright © 2017 PayPal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKWbViewSimpleController.h"


@implementation WKWbViewSimpleController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fullURL = @"https://paypalmerchant.herokuapp.com/cart";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    WKWebViewConfiguration *theConfiguration =
    [[WKWebViewConfiguration alloc] init];
    [theConfiguration.userContentController
        addScriptMessageHandler:self
        name:@"webview-sample"];
    
    _viewWeb = [[WKWebView alloc] initWithFrame:self.someView.frame
                                     configuration:theConfiguration];
    _viewWeb.navigationDelegate = self;
    [_viewWeb loadRequest:request];
    [[PYPLCheckout sharedInstance] setWKWebView:(WKWebView*)self.viewWeb];
    [self.view addSubview:_viewWeb];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
        NSURLRequest *request = navigationAction.request;

        decisionHandler(([[PYPLCheckout sharedInstance] handleIfPPCheckout: (NSURLRequest *) request]) ?  WKNavigationActionPolicyAllow : WKNavigationActionPolicyCancel);
   }

- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message{
    //NSDictionary *sentData = (NSDictionary*)message.body;
    //long aCount = [sentData[@"count"] integerValue];
    //aCount++;
    //[_theWebView evaluateJavaScript:[NSString
                                     //stringWithFormat:@"storeAndShow(%ld)", aCount] completionHandler:nil];
}
@end

