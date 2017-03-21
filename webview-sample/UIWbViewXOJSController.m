//
//  UIWbViewSimpleController.m
//  webview-sample
//
//  Created by Venkatakrishnan,Poornima on 2/22/17.
//  Copyright © 2017 PayPal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIWbViewXOJSController.h"

@implementation UIWbViewXOJSController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Opening the webview");
    NSString *fullURL = @"https://paypalmerchant.herokuapp.com/cartv2";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.viewWeb loadRequest:requestObj];
    self.viewWeb.delegate = self;
    //Paypal Setup 2:
    // init the paypal view inside the controller
    // that  needs native checkout
    [[PYPLCheckout sharedInstance] setWebView:(UIWebView*)self.viewWeb];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    
    //Paypal Setup 3:
    //Listen in on the webview for checkout urls
    return [[PYPLCheckout sharedInstance] handleIfPPCheckout: (NSURLRequest *) request];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error : %@",error);
}


@end
