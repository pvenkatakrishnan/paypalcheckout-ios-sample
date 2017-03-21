//
//  WKWbViewSimpleController.h
//  webview-sample
//
//  Created by Venkatakrishnan,Poornima on 2/22/17.
//  Copyright © 2017 PayPal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NativeCheckout/PYPLCheckout.h>
#import <WebKit/WebKit.h>

@interface WKWbViewSimpleController : UIViewController <WKScriptMessageHandler>
@property (weak, nonatomic) IBOutlet UIWebView *someView;
@property (strong, nonatomic) WKWebView *viewWeb;
@end

